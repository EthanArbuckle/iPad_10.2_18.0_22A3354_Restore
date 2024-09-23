@implementation ALSLocationRequest

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  -[ALSLocationRequest setCellTowers:](self, "setCellTowers:", 0);
  -[ALSLocationRequest setWirelessAPs:](self, "setWirelessAPs:", 0);
  -[ALSLocationRequest setAppBundleId:](self, "setAppBundleId:", 0);
  -[ALSLocationRequest setCdmaCellTowers:](self, "setCdmaCellTowers:", 0);
  -[ALSLocationRequest setCdmaEvdoTowers:](self, "setCdmaEvdoTowers:", 0);
  -[ALSLocationRequest setLteCellTowers:](self, "setLteCellTowers:", 0);
  -[ALSLocationRequest setScdmaCellTowers:](self, "setScdmaCellTowers:", 0);
  -[ALSLocationRequest setNr5GCellTowers:](self, "setNr5GCellTowers:", 0);
  PBRepeatedInt32Clear(&self->_surroundingWifiBands, v3);
  -[ALSLocationRequest setMeta:](self, "setMeta:", 0);
  v4.receiver = self;
  v4.super_class = (Class)ALSLocationRequest;
  -[ALSLocationRequest dealloc](&v4, "dealloc");
}

- (void)clearCellTowers
{
  -[NSMutableArray removeAllObjects](self->_cellTowers, "removeAllObjects");
}

- (void)addCellTower:(id)a3
{
  NSMutableArray *cellTowers;

  cellTowers = self->_cellTowers;
  if (!cellTowers)
  {
    cellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cellTowers = cellTowers;
  }
  -[NSMutableArray addObject:](cellTowers, "addObject:", a3);
}

- (unint64_t)cellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_cellTowers, "count");
}

- (id)cellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cellTowers, "objectAtIndex:", a3);
}

+ (Class)cellTowerType
{
  return (Class)objc_opt_class(ALSCellTower, a2);
}

- (void)clearWirelessAPs
{
  -[NSMutableArray removeAllObjects](self->_wirelessAPs, "removeAllObjects");
}

- (void)addWirelessAP:(id)a3
{
  NSMutableArray *wirelessAPs;

  wirelessAPs = self->_wirelessAPs;
  if (!wirelessAPs)
  {
    wirelessAPs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_wirelessAPs = wirelessAPs;
  }
  -[NSMutableArray addObject:](wirelessAPs, "addObject:", a3);
}

- (unint64_t)wirelessAPsCount
{
  return (unint64_t)-[NSMutableArray count](self->_wirelessAPs, "count");
}

- (id)wirelessAPAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_wirelessAPs, "objectAtIndex:", a3);
}

+ (Class)wirelessAPType
{
  return (Class)objc_opt_class(ALSWirelessAP, a2);
}

- (void)setNumberOfSurroundingCells:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfSurroundingCells = a3;
}

- (void)setHasNumberOfSurroundingCells:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfSurroundingCells
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumberOfSurroundingWifis:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numberOfSurroundingWifis = a3;
}

- (void)setHasNumberOfSurroundingWifis:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfSurroundingWifis
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)clearCdmaCellTowers
{
  -[NSMutableArray removeAllObjects](self->_cdmaCellTowers, "removeAllObjects");
}

- (void)addCdmaCellTower:(id)a3
{
  NSMutableArray *cdmaCellTowers;

  cdmaCellTowers = self->_cdmaCellTowers;
  if (!cdmaCellTowers)
  {
    cdmaCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cdmaCellTowers = cdmaCellTowers;
  }
  -[NSMutableArray addObject:](cdmaCellTowers, "addObject:", a3);
}

- (unint64_t)cdmaCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_cdmaCellTowers, "count");
}

- (id)cdmaCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cdmaCellTowers, "objectAtIndex:", a3);
}

+ (Class)cdmaCellTowerType
{
  return (Class)objc_opt_class(ALSCdmaCellTower, a2);
}

- (void)clearCdmaEvdoTowers
{
  -[NSMutableArray removeAllObjects](self->_cdmaEvdoTowers, "removeAllObjects");
}

- (void)addCdmaEvdoTower:(id)a3
{
  NSMutableArray *cdmaEvdoTowers;

  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  if (!cdmaEvdoTowers)
  {
    cdmaEvdoTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_cdmaEvdoTowers = cdmaEvdoTowers;
  }
  -[NSMutableArray addObject:](cdmaEvdoTowers, "addObject:", a3);
}

- (unint64_t)cdmaEvdoTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_cdmaEvdoTowers, "count");
}

- (id)cdmaEvdoTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cdmaEvdoTowers, "objectAtIndex:", a3);
}

+ (Class)cdmaEvdoTowerType
{
  return (Class)objc_opt_class(ALSCdmaEvdoTower, a2);
}

- (void)setNumberOfSurroundingCdmaCells:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numberOfSurroundingCdmaCells = a3;
}

- (void)setHasNumberOfSurroundingCdmaCells:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfSurroundingCdmaCells
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumberOfSurroundingCdmaEvdoCells:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfSurroundingCdmaEvdoCells = a3;
}

- (void)setHasNumberOfSurroundingCdmaEvdoCells:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfSurroundingCdmaEvdoCells
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearLteCellTowers
{
  -[NSMutableArray removeAllObjects](self->_lteCellTowers, "removeAllObjects");
}

- (void)addLteCellTower:(id)a3
{
  NSMutableArray *lteCellTowers;

  lteCellTowers = self->_lteCellTowers;
  if (!lteCellTowers)
  {
    lteCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_lteCellTowers = lteCellTowers;
  }
  -[NSMutableArray addObject:](lteCellTowers, "addObject:", a3);
}

- (unint64_t)lteCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_lteCellTowers, "count");
}

- (id)lteCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_lteCellTowers, "objectAtIndex:", a3);
}

+ (Class)lteCellTowerType
{
  return (Class)objc_opt_class(ALSLteCellTower, a2);
}

- (void)setNumberOfSurroundingLteCells:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfSurroundingLteCells = a3;
}

- (void)setHasNumberOfSurroundingLteCells:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfSurroundingLteCells
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearScdmaCellTowers
{
  -[NSMutableArray removeAllObjects](self->_scdmaCellTowers, "removeAllObjects");
}

- (void)addScdmaCellTower:(id)a3
{
  NSMutableArray *scdmaCellTowers;

  scdmaCellTowers = self->_scdmaCellTowers;
  if (!scdmaCellTowers)
  {
    scdmaCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_scdmaCellTowers = scdmaCellTowers;
  }
  -[NSMutableArray addObject:](scdmaCellTowers, "addObject:", a3);
}

- (unint64_t)scdmaCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_scdmaCellTowers, "count");
}

- (id)scdmaCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_scdmaCellTowers, "objectAtIndex:", a3);
}

+ (Class)scdmaCellTowerType
{
  return (Class)objc_opt_class(ALSScdmaCellTower, a2);
}

- (void)setNumberOfSurroundingScdmaCells:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numberOfSurroundingScdmaCells = a3;
}

- (void)setHasNumberOfSurroundingScdmaCells:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumberOfSurroundingScdmaCells
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearNr5GCellTowers
{
  -[NSMutableArray removeAllObjects](self->_nr5GCellTowers, "removeAllObjects");
}

- (void)addNr5GCellTower:(id)a3
{
  NSMutableArray *nr5GCellTowers;

  nr5GCellTowers = self->_nr5GCellTowers;
  if (!nr5GCellTowers)
  {
    nr5GCellTowers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_nr5GCellTowers = nr5GCellTowers;
  }
  -[NSMutableArray addObject:](nr5GCellTowers, "addObject:", a3);
}

- (unint64_t)nr5GCellTowersCount
{
  return (unint64_t)-[NSMutableArray count](self->_nr5GCellTowers, "count");
}

- (id)nr5GCellTowerAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_nr5GCellTowers, "objectAtIndex:", a3);
}

+ (Class)nr5GCellTowerType
{
  return (Class)objc_opt_class(ALSNr5GCellTower, a2);
}

- (void)setNumberOfSurroundingNr5GCells:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfSurroundingNr5GCells = a3;
}

- (void)setHasNumberOfSurroundingNr5GCells:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfSurroundingNr5GCells
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unint64_t)surroundingWifiBandsCount
{
  return self->_surroundingWifiBands.count;
}

- (int)surroundingWifiBands
{
  return self->_surroundingWifiBands.list;
}

- (void)clearSurroundingWifiBands
{
  PBRepeatedInt32Clear(&self->_surroundingWifiBands, a2);
}

- (void)addSurroundingWifiBands:(int)a3
{
  PBRepeatedInt32Add(&self->_surroundingWifiBands, *(_QWORD *)&a3);
}

- (int)surroundingWifiBandsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_surroundingWifiBands;
  unint64_t count;

  p_surroundingWifiBands = &self->_surroundingWifiBands;
  count = self->_surroundingWifiBands.count;
  if (count <= a3)
    -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_surroundingWifiBands->list[a3];
}

- (void)setSurroundingWifiBands:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_surroundingWifiBands, a3, a4);
}

- (id)surroundingWifiBandsAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("k2dot4GHZ");
  if (a3 == 2)
    return CFSTR("k5GHZ");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsSurroundingWifiBands:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("k2dot4GHZ")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("k5GHZ")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (int)wifiAltitudeScale
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    return self->_wifiAltitudeScale;
  else
    return 1;
}

- (void)setWifiAltitudeScale:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_wifiAltitudeScale = a3;
}

- (void)setHasWifiAltitudeScale:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasWifiAltitudeScale
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)wifiAltitudeScaleAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("kWifiAltitudeScaleNone");
  if (a3 == 2)
    return CFSTR("kWifiAltitudeScale10toThe2");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsWifiAltitudeScale:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("kWifiAltitudeScaleNone")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("kWifiAltitudeScale10toThe2")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (BOOL)hasMeta
{
  return self->_meta != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSLocationRequest;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSLocationRequest description](&v3, "description"), -[ALSLocationRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  id v4;
  NSMutableArray *cellTowers;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  NSMutableArray *wirelessAPs;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  char has;
  NSString *appBundleId;
  id v18;
  NSMutableArray *cdmaCellTowers;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  id v24;
  NSMutableArray *cdmaEvdoTowers;
  id v26;
  id v27;
  uint64_t v28;
  void *m;
  char v30;
  id v31;
  NSMutableArray *lteCellTowers;
  id v33;
  id v34;
  uint64_t v35;
  void *n;
  id v37;
  NSMutableArray *scdmaCellTowers;
  id v39;
  id v40;
  uint64_t v41;
  void *ii;
  id v43;
  NSMutableArray *nr5GCellTowers;
  id v45;
  id v46;
  uint64_t v47;
  void *jj;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_surroundingWifiBands;
  NSMutableArray *v50;
  unint64_t v51;
  int v52;
  const __CFString *v53;
  int wifiAltitudeScale;
  const __CFString *v55;
  ALSMeta *meta;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_cellTowers, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cellTowers, "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    cellTowers = self->_cellTowers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v83 != v8)
            objc_enumerationMutation(cellTowers);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("cellTower"));

  }
  if (-[NSMutableArray count](self->_wirelessAPs, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_wirelessAPs, "count"));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    wirelessAPs = self->_wirelessAPs;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v79 != v14)
            objc_enumerationMutation(wirelessAPs);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("wirelessAP"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingCells), CFSTR("numberOfSurroundingCells"));
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingWifis), CFSTR("numberOfSurroundingWifis"));
  appBundleId = self->_appBundleId;
  if (appBundleId)
    objc_msgSend(v3, "setObject:forKey:", appBundleId, CFSTR("appBundleId"));
  if (-[NSMutableArray count](self->_cdmaCellTowers, "count"))
  {
    v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cdmaCellTowers, "count"));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(_QWORD *)v75 != v22)
            objc_enumerationMutation(cdmaCellTowers);
          objc_msgSend(v18, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
      }
      while (v21);
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("cdmaCellTower"));

  }
  if (-[NSMutableArray count](self->_cdmaEvdoTowers, "count"))
  {
    v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cdmaEvdoTowers, "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    cdmaEvdoTowers = self->_cdmaEvdoTowers;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v71;
      do
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(_QWORD *)v71 != v28)
            objc_enumerationMutation(cdmaEvdoTowers);
          objc_msgSend(v24, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v70, v89, 16);
      }
      while (v27);
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("cdmaEvdoTower"));

  }
  v30 = (char)self->_has;
  if ((v30 & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingCdmaCells), CFSTR("numberOfSurroundingCdmaCells"));
    v30 = (char)self->_has;
  }
  if ((v30 & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingCdmaEvdoCells), CFSTR("numberOfSurroundingCdmaEvdoCells"));
  if (-[NSMutableArray count](self->_lteCellTowers, "count"))
  {
    v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lteCellTowers, "count"));
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    lteCellTowers = self->_lteCellTowers;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v67;
      do
      {
        for (n = 0; n != v34; n = (char *)n + 1)
        {
          if (*(_QWORD *)v67 != v35)
            objc_enumerationMutation(lteCellTowers);
          objc_msgSend(v31, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation"));
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v66, v88, 16);
      }
      while (v34);
    }
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("lteCellTower"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingLteCells), CFSTR("numberOfSurroundingLteCells"));
  if (-[NSMutableArray count](self->_scdmaCellTowers, "count"))
  {
    v37 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_scdmaCellTowers, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v63;
      do
      {
        for (ii = 0; ii != v40; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v63 != v41)
            objc_enumerationMutation(scdmaCellTowers);
          objc_msgSend(v37, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)ii), "dictionaryRepresentation"));
        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v62, v87, 16);
      }
      while (v40);
    }
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("scdmaCellTower"));

  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingScdmaCells), CFSTR("numberOfSurroundingScdmaCells"));
  if (-[NSMutableArray count](self->_nr5GCellTowers, "count"))
  {
    v43 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nr5GCellTowers, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v59;
      do
      {
        for (jj = 0; jj != v46; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v59 != v47)
            objc_enumerationMutation(nr5GCellTowers);
          objc_msgSend(v43, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)jj), "dictionaryRepresentation"));
        }
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v58, v86, 16);
      }
      while (v46);
    }
    objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("nr5GCellTower"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_numberOfSurroundingNr5GCells), CFSTR("numberOfSurroundingNr5GCells"));
  p_surroundingWifiBands = &self->_surroundingWifiBands;
  if (self->_surroundingWifiBands.count)
  {
    v50 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    if (self->_surroundingWifiBands.count)
    {
      v51 = 0;
      do
      {
        v52 = p_surroundingWifiBands->list[v51];
        if (v52 == 1)
        {
          v53 = CFSTR("k2dot4GHZ");
        }
        else if (v52 == 2)
        {
          v53 = CFSTR("k5GHZ");
        }
        else
        {
          v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_surroundingWifiBands->list[v51]);
        }
        -[NSMutableArray addObject:](v50, "addObject:", v53);
        ++v51;
      }
      while (v51 < self->_surroundingWifiBands.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("surroundingWifiBands"));
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    wifiAltitudeScale = self->_wifiAltitudeScale;
    if (wifiAltitudeScale == 1)
    {
      v55 = CFSTR("kWifiAltitudeScaleNone");
    }
    else if (wifiAltitudeScale == 2)
    {
      v55 = CFSTR("kWifiAltitudeScale10toThe2");
    }
    else
    {
      v55 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_wifiAltitudeScale);
    }
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("wifiAltitudeScale"));
  }
  meta = self->_meta;
  if (meta)
    objc_msgSend(v3, "setObject:forKey:", -[ALSMeta dictionaryRepresentation](meta, "dictionaryRepresentation"), CFSTR("meta"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F05858((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *cellTowers;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  NSMutableArray *wirelessAPs;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  char has;
  NSString *appBundleId;
  NSMutableArray *cdmaCellTowers;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  NSMutableArray *cdmaEvdoTowers;
  id v23;
  id v24;
  uint64_t v25;
  void *m;
  char v27;
  NSMutableArray *lteCellTowers;
  id v29;
  id v30;
  uint64_t v31;
  void *n;
  NSMutableArray *scdmaCellTowers;
  id v34;
  id v35;
  uint64_t v36;
  void *ii;
  NSMutableArray *nr5GCellTowers;
  id v39;
  id v40;
  uint64_t v41;
  void *jj;
  unint64_t v43;
  ALSMeta *meta;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  cellTowers = self->_cellTowers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v8)
          objc_enumerationMutation(cellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i), 1);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    }
    while (v7);
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  wirelessAPs = self->_wirelessAPs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v66 != v13)
          objc_enumerationMutation(wirelessAPs);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j), 2);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v12);
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingCells, 3);
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingWifis, 4);
  appBundleId = self->_appBundleId;
  if (appBundleId)
    PBDataWriterWriteStringField(a3, appBundleId, 5);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(_QWORD *)v62 != v20)
          objc_enumerationMutation(cdmaCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)k), 21);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    }
    while (v19);
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v58;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(_QWORD *)v58 != v25)
          objc_enumerationMutation(cdmaEvdoTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)m), 22);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    }
    while (v24);
  }
  v27 = (char)self->_has;
  if ((v27 & 1) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingCdmaCells, 23);
    v27 = (char)self->_has;
  }
  if ((v27 & 2) != 0)
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingCdmaEvdoCells, 24);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  lteCellTowers = self->_lteCellTowers;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v30; n = (char *)n + 1)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(lteCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)n), 25);
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
    }
    while (v30);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingLteCells, 26);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      for (ii = 0; ii != v35; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(scdmaCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)ii), 27);
      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
    }
    while (v35);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingScdmaCells, 28);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v45, v73, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v46;
    do
    {
      for (jj = 0; jj != v40; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(nr5GCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)jj), 29);
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v45, v73, 16);
    }
    while (v40);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field(a3, self->_numberOfSurroundingNr5GCells, 30);
  if (self->_surroundingWifiBands.count)
  {
    v43 = 0;
    do
      PBDataWriterWriteInt32Field(a3, self->_surroundingWifiBands.list[v43++], 31);
    while (v43 < self->_surroundingWifiBands.count);
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteInt32Field(a3, self->_wifiAltitudeScale, 32);
  meta = self->_meta;
  if (meta)
    PBDataWriterWriteSubmessage(a3, meta, 33);
}

- (unsigned)requestTypeCode
{
  return 1;
}

- (Class)responseClass
{
  return (Class)objc_opt_class(ALSLocationResponse, a2);
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  char has;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  char v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  unint64_t v25;
  unint64_t v26;
  uint64_t jj;
  unint64_t v28;
  unint64_t v29;
  uint64_t kk;

  if (-[ALSLocationRequest cellTowersCount](self, "cellTowersCount"))
  {
    objc_msgSend(a3, "clearCellTowers");
    v5 = -[ALSLocationRequest cellTowersCount](self, "cellTowersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addCellTower:", -[ALSLocationRequest cellTowerAtIndex:](self, "cellTowerAtIndex:", i));
    }
  }
  if (-[ALSLocationRequest wirelessAPsCount](self, "wirelessAPsCount"))
  {
    objc_msgSend(a3, "clearWirelessAPs");
    v8 = -[ALSLocationRequest wirelessAPsCount](self, "wirelessAPsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addWirelessAP:", -[ALSLocationRequest wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j));
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_numberOfSurroundingCells;
    *((_BYTE *)a3 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)a3 + 28) = self->_numberOfSurroundingWifis;
    *((_BYTE *)a3 + 144) |= 0x40u;
  }
  if (self->_appBundleId)
    objc_msgSend(a3, "setAppBundleId:");
  if (-[ALSLocationRequest cdmaCellTowersCount](self, "cdmaCellTowersCount"))
  {
    objc_msgSend(a3, "clearCdmaCellTowers");
    v12 = -[ALSLocationRequest cdmaCellTowersCount](self, "cdmaCellTowersCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(a3, "addCdmaCellTower:", -[ALSLocationRequest cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k));
    }
  }
  if (-[ALSLocationRequest cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount"))
  {
    objc_msgSend(a3, "clearCdmaEvdoTowers");
    v15 = -[ALSLocationRequest cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(a3, "addCdmaEvdoTower:", -[ALSLocationRequest cdmaEvdoTowerAtIndex:](self, "cdmaEvdoTowerAtIndex:", m));
    }
  }
  v18 = (char)self->_has;
  if ((v18 & 1) != 0)
  {
    *((_DWORD *)a3 + 22) = self->_numberOfSurroundingCdmaCells;
    *((_BYTE *)a3 + 144) |= 1u;
    v18 = (char)self->_has;
  }
  if ((v18 & 2) != 0)
  {
    *((_DWORD *)a3 + 23) = self->_numberOfSurroundingCdmaEvdoCells;
    *((_BYTE *)a3 + 144) |= 2u;
  }
  if (-[ALSLocationRequest lteCellTowersCount](self, "lteCellTowersCount"))
  {
    objc_msgSend(a3, "clearLteCellTowers");
    v19 = -[ALSLocationRequest lteCellTowersCount](self, "lteCellTowersCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(a3, "addLteCellTower:", -[ALSLocationRequest lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", n));
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_numberOfSurroundingLteCells;
    *((_BYTE *)a3 + 144) |= 8u;
  }
  if (-[ALSLocationRequest scdmaCellTowersCount](self, "scdmaCellTowersCount"))
  {
    objc_msgSend(a3, "clearScdmaCellTowers");
    v22 = -[ALSLocationRequest scdmaCellTowersCount](self, "scdmaCellTowersCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
        objc_msgSend(a3, "addScdmaCellTower:", -[ALSLocationRequest scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", ii));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 27) = self->_numberOfSurroundingScdmaCells;
    *((_BYTE *)a3 + 144) |= 0x20u;
  }
  if (-[ALSLocationRequest nr5GCellTowersCount](self, "nr5GCellTowersCount"))
  {
    objc_msgSend(a3, "clearNr5GCellTowers");
    v25 = -[ALSLocationRequest nr5GCellTowersCount](self, "nr5GCellTowersCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
        objc_msgSend(a3, "addNr5GCellTower:", -[ALSLocationRequest nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", jj));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 26) = self->_numberOfSurroundingNr5GCells;
    *((_BYTE *)a3 + 144) |= 0x10u;
  }
  if (-[ALSLocationRequest surroundingWifiBandsCount](self, "surroundingWifiBandsCount"))
  {
    objc_msgSend(a3, "clearSurroundingWifiBands");
    v28 = -[ALSLocationRequest surroundingWifiBandsCount](self, "surroundingWifiBandsCount");
    if (v28)
    {
      v29 = v28;
      for (kk = 0; kk != v29; ++kk)
        objc_msgSend(a3, "addSurroundingWifiBands:", -[ALSLocationRequest surroundingWifiBandsAtIndex:](self, "surroundingWifiBandsAtIndex:", kk));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)a3 + 32) = self->_wifiAltitudeScale;
    *((_BYTE *)a3 + 144) |= 0x80u;
  }
  if (self->_meta)
    objc_msgSend(a3, "setMeta:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *cellTowers;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  NSMutableArray *wirelessAPs;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  char has;
  NSMutableArray *cdmaCellTowers;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  id v24;
  NSMutableArray *cdmaEvdoTowers;
  id v26;
  id v27;
  uint64_t v28;
  void *m;
  id v30;
  char v31;
  NSMutableArray *lteCellTowers;
  id v33;
  id v34;
  uint64_t v35;
  void *n;
  id v37;
  NSMutableArray *scdmaCellTowers;
  id v39;
  id v40;
  uint64_t v41;
  void *ii;
  id v43;
  NSMutableArray *nr5GCellTowers;
  id v45;
  id v46;
  uint64_t v47;
  void *jj;
  id v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  cellTowers = self->_cellTowers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v76 != v9)
          objc_enumerationMutation(cellTowers);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addCellTower:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    }
    while (v8);
  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  wirelessAPs = self->_wirelessAPs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v72 != v15)
          objc_enumerationMutation(wirelessAPs);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addWirelessAP:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    }
    while (v14);
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_numberOfSurroundingCells;
    *((_BYTE *)v5 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_numberOfSurroundingWifis;
    *((_BYTE *)v5 + 144) |= 0x40u;
  }

  v5[4] = -[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v68 != v22)
          objc_enumerationMutation(cdmaCellTowers);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdmaCellTower:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v21);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v64;
    do
    {
      for (m = 0; m != v27; m = (char *)m + 1)
      {
        if (*(_QWORD *)v64 != v28)
          objc_enumerationMutation(cdmaEvdoTowers);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdmaEvdoTower:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    }
    while (v27);
  }
  v31 = (char)self->_has;
  if ((v31 & 1) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_numberOfSurroundingCdmaCells;
    *((_BYTE *)v5 + 144) |= 1u;
    v31 = (char)self->_has;
  }
  if ((v31 & 2) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_numberOfSurroundingCdmaEvdoCells;
    *((_BYTE *)v5 + 144) |= 2u;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  lteCellTowers = self->_lteCellTowers;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v60;
    do
    {
      for (n = 0; n != v34; n = (char *)n + 1)
      {
        if (*(_QWORD *)v60 != v35)
          objc_enumerationMutation(lteCellTowers);
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3);
        objc_msgSend(v5, "addLteCellTower:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
    }
    while (v34);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 25) = self->_numberOfSurroundingLteCells;
    *((_BYTE *)v5 + 144) |= 8u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v56;
    do
    {
      for (ii = 0; ii != v40; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v56 != v41)
          objc_enumerationMutation(scdmaCellTowers);
        v43 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)ii), "copyWithZone:", a3);
        objc_msgSend(v5, "addScdmaCellTower:", v43);

      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
    }
    while (v40);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 27) = self->_numberOfSurroundingScdmaCells;
    *((_BYTE *)v5 + 144) |= 0x20u;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v51, v79, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v52;
    do
    {
      for (jj = 0; jj != v46; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v52 != v47)
          objc_enumerationMutation(nr5GCellTowers);
        v49 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)jj), "copyWithZone:", a3);
        objc_msgSend(v5, "addNr5GCellTower:", v49);

      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v51, v79, 16);
    }
    while (v46);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_numberOfSurroundingNr5GCells;
    *((_BYTE *)v5 + 144) |= 0x10u;
  }
  PBRepeatedInt32Copy(v5 + 1, &self->_surroundingWifiBands);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v5 + 32) = self->_wifiAltitudeScale;
    *((_BYTE *)v5 + 144) |= 0x80u;
  }

  v5[9] = -[ALSMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int IsEqual;
  NSMutableArray *cellTowers;
  NSMutableArray *wirelessAPs;
  NSString *appBundleId;
  NSMutableArray *cdmaCellTowers;
  NSMutableArray *cdmaEvdoTowers;
  char has;
  NSMutableArray *lteCellTowers;
  NSMutableArray *scdmaCellTowers;
  NSMutableArray *nr5GCellTowers;
  int v15;
  ALSMeta *meta;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (IsEqual)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((_QWORD *)a3 + 7))
      || (IsEqual = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((_QWORD *)a3 + 17))
        || (IsEqual = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 144) & 4) == 0 || self->_numberOfSurroundingCells != *((_DWORD *)a3 + 24))
            goto LABEL_63;
        }
        else if ((*((_BYTE *)a3 + 144) & 4) != 0)
        {
          goto LABEL_63;
        }
        if ((*(_BYTE *)&self->_has & 0x40) != 0)
        {
          if ((*((_BYTE *)a3 + 144) & 0x40) == 0 || self->_numberOfSurroundingWifis != *((_DWORD *)a3 + 28))
            goto LABEL_63;
        }
        else if ((*((_BYTE *)a3 + 144) & 0x40) != 0)
        {
          goto LABEL_63;
        }
        appBundleId = self->_appBundleId;
        if (!((unint64_t)appBundleId | *((_QWORD *)a3 + 4))
          || (IsEqual = -[NSString isEqual:](appBundleId, "isEqual:")) != 0)
        {
          cdmaCellTowers = self->_cdmaCellTowers;
          if (!((unint64_t)cdmaCellTowers | *((_QWORD *)a3 + 5))
            || (IsEqual = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
          {
            cdmaEvdoTowers = self->_cdmaEvdoTowers;
            if (!((unint64_t)cdmaEvdoTowers | *((_QWORD *)a3 + 6))
              || (IsEqual = -[NSMutableArray isEqual:](cdmaEvdoTowers, "isEqual:")) != 0)
            {
              has = (char)self->_has;
              if ((has & 1) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 1) == 0 || self->_numberOfSurroundingCdmaCells != *((_DWORD *)a3 + 22))
                  goto LABEL_63;
              }
              else if ((*((_BYTE *)a3 + 144) & 1) != 0)
              {
                goto LABEL_63;
              }
              if ((*(_BYTE *)&self->_has & 2) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 2) == 0 || self->_numberOfSurroundingCdmaEvdoCells != *((_DWORD *)a3 + 23))
                  goto LABEL_63;
              }
              else if ((*((_BYTE *)a3 + 144) & 2) != 0)
              {
                goto LABEL_63;
              }
              lteCellTowers = self->_lteCellTowers;
              if ((unint64_t)lteCellTowers | *((_QWORD *)a3 + 8))
              {
                IsEqual = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:");
                if (!IsEqual)
                  return IsEqual;
                has = (char)self->_has;
              }
              if ((has & 8) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 8) == 0 || self->_numberOfSurroundingLteCells != *((_DWORD *)a3 + 25))
                  goto LABEL_63;
              }
              else if ((*((_BYTE *)a3 + 144) & 8) != 0)
              {
                goto LABEL_63;
              }
              scdmaCellTowers = self->_scdmaCellTowers;
              if ((unint64_t)scdmaCellTowers | *((_QWORD *)a3 + 15))
              {
                IsEqual = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:");
                if (!IsEqual)
                  return IsEqual;
                has = (char)self->_has;
              }
              if ((has & 0x20) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 0x20) == 0 || self->_numberOfSurroundingScdmaCells != *((_DWORD *)a3 + 27))
                  goto LABEL_63;
              }
              else if ((*((_BYTE *)a3 + 144) & 0x20) != 0)
              {
                goto LABEL_63;
              }
              nr5GCellTowers = self->_nr5GCellTowers;
              if ((unint64_t)nr5GCellTowers | *((_QWORD *)a3 + 10))
              {
                IsEqual = -[NSMutableArray isEqual:](nr5GCellTowers, "isEqual:");
                if (!IsEqual)
                  return IsEqual;
                has = (char)self->_has;
              }
              if ((has & 0x10) != 0)
              {
                if ((*((_BYTE *)a3 + 144) & 0x10) == 0 || self->_numberOfSurroundingNr5GCells != *((_DWORD *)a3 + 26))
                  goto LABEL_63;
              }
              else if ((*((_BYTE *)a3 + 144) & 0x10) != 0)
              {
                goto LABEL_63;
              }
              IsEqual = PBRepeatedInt32IsEqual(&self->_surroundingWifiBands, (char *)a3 + 8);
              if (IsEqual)
              {
                v15 = *((char *)a3 + 144);
                if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
                {
                  if ((v15 & 0x80000000) == 0 || self->_wifiAltitudeScale != *((_DWORD *)a3 + 32))
                    goto LABEL_63;
                }
                else if (v15 < 0)
                {
LABEL_63:
                  LOBYTE(IsEqual) = 0;
                  return IsEqual;
                }
                meta = self->_meta;
                if ((unint64_t)meta | *((_QWORD *)a3 + 9))
                  LOBYTE(IsEqual) = -[ALSMeta isEqual:](meta, "isEqual:");
                else
                  LOBYTE(IsEqual) = 1;
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  NSUInteger v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v3 = -[NSMutableArray hash](self->_cellTowers, "hash");
  v4 = -[NSMutableArray hash](self->_wirelessAPs, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v20 = 2654435761 * self->_numberOfSurroundingCells;
  else
    v20 = 0;
  v23 = (unint64_t)v4;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v19 = 2654435761 * self->_numberOfSurroundingWifis;
  else
    v19 = 0;
  v5 = -[NSString hash](self->_appBundleId, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_cdmaCellTowers, "hash");
  v7 = -[NSMutableArray hash](self->_cdmaEvdoTowers, "hash");
  v24 = (unint64_t)v3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v18 = 2654435761 * self->_numberOfSurroundingCdmaCells;
  else
    v18 = 0;
  v22 = (unint64_t)v7;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v8 = -[NSMutableArray hash](self->_lteCellTowers, "hash", 2654435761 * self->_numberOfSurroundingCdmaEvdoCells);
  else
    v8 = -[NSMutableArray hash](self->_lteCellTowers, "hash", 0);
  v21 = (unint64_t)v8;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v9 = 2654435761 * self->_numberOfSurroundingLteCells;
  else
    v9 = 0;
  v10 = (unint64_t)-[NSMutableArray hash](self->_scdmaCellTowers, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v11 = 2654435761 * self->_numberOfSurroundingScdmaCells;
  else
    v11 = 0;
  v12 = (unint64_t)-[NSMutableArray hash](self->_nr5GCellTowers, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v13 = 2654435761 * self->_numberOfSurroundingNr5GCells;
  else
    v13 = 0;
  v14 = PBRepeatedInt32Hash(&self->_surroundingWifiBands);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v15 = 2654435761 * self->_wifiAltitudeScale;
  else
    v15 = 0;
  return v23 ^ v24 ^ v20 ^ v19 ^ v5 ^ v6 ^ v22 ^ v18 ^ v17 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[ALSMeta hash](self->_meta, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  char v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *m;
  char v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *n;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *ii;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *jj;
  char *v42;
  char *v43;
  char *kk;
  ALSMeta *meta;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];

  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v8)
          objc_enumerationMutation(v5);
        -[ALSLocationRequest addCellTower:](self, "addCellTower:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v7);
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 17);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(v10);
        -[ALSLocationRequest addWirelessAP:](self, "addWirelessAP:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v12);
  }
  v15 = *((_BYTE *)a3 + 144);
  if ((v15 & 4) != 0)
  {
    self->_numberOfSurroundingCells = *((_DWORD *)a3 + 24);
    *(_BYTE *)&self->_has |= 4u;
    v15 = *((_BYTE *)a3 + 144);
  }
  if ((v15 & 0x40) != 0)
  {
    self->_numberOfSurroundingWifis = *((_DWORD *)a3 + 28);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)a3 + 4))
    -[ALSLocationRequest setAppBundleId:](self, "setAppBundleId:");
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v16 = (void *)*((_QWORD *)a3 + 5);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v64;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v64 != v19)
          objc_enumerationMutation(v16);
        -[ALSLocationRequest addCdmaCellTower:](self, "addCdmaCellTower:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    }
    while (v18);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v21 = (void *)*((_QWORD *)a3 + 6);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v60;
    do
    {
      for (m = 0; m != v23; m = (char *)m + 1)
      {
        if (*(_QWORD *)v60 != v24)
          objc_enumerationMutation(v21);
        -[ALSLocationRequest addCdmaEvdoTower:](self, "addCdmaEvdoTower:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)m));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
    }
    while (v23);
  }
  v26 = *((_BYTE *)a3 + 144);
  if ((v26 & 1) != 0)
  {
    self->_numberOfSurroundingCdmaCells = *((_DWORD *)a3 + 22);
    *(_BYTE *)&self->_has |= 1u;
    v26 = *((_BYTE *)a3 + 144);
  }
  if ((v26 & 2) != 0)
  {
    self->_numberOfSurroundingCdmaEvdoCells = *((_DWORD *)a3 + 23);
    *(_BYTE *)&self->_has |= 2u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v27 = (void *)*((_QWORD *)a3 + 8);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v56;
    do
    {
      for (n = 0; n != v29; n = (char *)n + 1)
      {
        if (*(_QWORD *)v56 != v30)
          objc_enumerationMutation(v27);
        -[ALSLocationRequest addLteCellTower:](self, "addLteCellTower:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)n));
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
    }
    while (v29);
  }
  if ((*((_BYTE *)a3 + 144) & 8) != 0)
  {
    self->_numberOfSurroundingLteCells = *((_DWORD *)a3 + 25);
    *(_BYTE *)&self->_has |= 8u;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v32 = (void *)*((_QWORD *)a3 + 15);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v52;
    do
    {
      for (ii = 0; ii != v34; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v52 != v35)
          objc_enumerationMutation(v32);
        -[ALSLocationRequest addScdmaCellTower:](self, "addScdmaCellTower:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)ii));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
    }
    while (v34);
  }
  if ((*((_BYTE *)a3 + 144) & 0x20) != 0)
  {
    self->_numberOfSurroundingScdmaCells = *((_DWORD *)a3 + 27);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v37 = (void *)*((_QWORD *)a3 + 10);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v48;
    do
    {
      for (jj = 0; jj != v39; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(v37);
        -[ALSLocationRequest addNr5GCellTower:](self, "addNr5GCellTower:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)jj));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
    }
    while (v39);
  }
  if ((*((_BYTE *)a3 + 144) & 0x10) != 0)
  {
    self->_numberOfSurroundingNr5GCells = *((_DWORD *)a3 + 26);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v42 = (char *)objc_msgSend(a3, "surroundingWifiBandsCount");
  if (v42)
  {
    v43 = v42;
    for (kk = 0; kk != v43; ++kk)
      -[ALSLocationRequest addSurroundingWifiBands:](self, "addSurroundingWifiBands:", objc_msgSend(a3, "surroundingWifiBandsAtIndex:", kk));
  }
  if (*((char *)a3 + 144) < 0)
  {
    self->_wifiAltitudeScale = *((_DWORD *)a3 + 32);
    *(_BYTE *)&self->_has |= 0x80u;
  }
  meta = self->_meta;
  v46 = *((_QWORD *)a3 + 9);
  if (meta)
  {
    if (v46)
      -[ALSMeta mergeFrom:](meta, "mergeFrom:");
  }
  else if (v46)
  {
    -[ALSLocationRequest setMeta:](self, "setMeta:");
  }
}

- (NSMutableArray)cellTowers
{
  return self->_cellTowers;
}

- (void)setCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)wirelessAPs
{
  return self->_wirelessAPs;
}

- (void)setWirelessAPs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (int)numberOfSurroundingCells
{
  return self->_numberOfSurroundingCells;
}

- (int)numberOfSurroundingWifis
{
  return self->_numberOfSurroundingWifis;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)cdmaCellTowers
{
  return self->_cdmaCellTowers;
}

- (void)setCdmaCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)cdmaEvdoTowers
{
  return self->_cdmaEvdoTowers;
}

- (void)setCdmaEvdoTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (int)numberOfSurroundingCdmaCells
{
  return self->_numberOfSurroundingCdmaCells;
}

- (int)numberOfSurroundingCdmaEvdoCells
{
  return self->_numberOfSurroundingCdmaEvdoCells;
}

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (int)numberOfSurroundingLteCells
{
  return self->_numberOfSurroundingLteCells;
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (int)numberOfSurroundingScdmaCells
{
  return self->_numberOfSurroundingScdmaCells;
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (int)numberOfSurroundingNr5GCells
{
  return self->_numberOfSurroundingNr5GCells;
}

- (ALSMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
