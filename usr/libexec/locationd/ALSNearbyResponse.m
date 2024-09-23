@implementation ALSNearbyResponse

- (void)dealloc
{
  objc_super v3;

  -[ALSNearbyResponse setCellTowers:](self, "setCellTowers:", 0);
  -[ALSNearbyResponse setWirelessAPs:](self, "setWirelessAPs:", 0);
  -[ALSNearbyResponse setCdmaCellTowers:](self, "setCdmaCellTowers:", 0);
  -[ALSNearbyResponse setCdmaEvdoTowers:](self, "setCdmaEvdoTowers:", 0);
  -[ALSNearbyResponse setLteCellTowers:](self, "setLteCellTowers:", 0);
  -[ALSNearbyResponse setScdmaCellTowers:](self, "setScdmaCellTowers:", 0);
  -[ALSNearbyResponse setNr5GCellTowers:](self, "setNr5GCellTowers:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSNearbyResponse;
  -[ALSNearbyResponse dealloc](&v3, "dealloc");
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

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSNearbyResponse;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSNearbyResponse description](&v3, "description"), -[ALSNearbyResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  id v16;
  NSMutableArray *cdmaCellTowers;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  id v22;
  NSMutableArray *cdmaEvdoTowers;
  id v24;
  id v25;
  uint64_t v26;
  void *m;
  id v28;
  NSMutableArray *lteCellTowers;
  id v30;
  id v31;
  uint64_t v32;
  void *n;
  id v34;
  NSMutableArray *scdmaCellTowers;
  id v36;
  id v37;
  uint64_t v38;
  void *ii;
  id v40;
  NSMutableArray *nr5GCellTowers;
  id v42;
  id v43;
  uint64_t v44;
  void *jj;
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

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_cellTowers, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cellTowers, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    cellTowers = self->_cellTowers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v72 != v8)
            objc_enumerationMutation(cellTowers);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("cellTower"));

  }
  if (-[NSMutableArray count](self->_wirelessAPs, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_wirelessAPs, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    wirelessAPs = self->_wirelessAPs;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v68 != v14)
            objc_enumerationMutation(wirelessAPs);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("wirelessAP"));

  }
  if (-[NSMutableArray count](self->_cdmaCellTowers, "count"))
  {
    v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cdmaCellTowers, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(_QWORD *)v64 != v20)
            objc_enumerationMutation(cdmaCellTowers);
          objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
      }
      while (v19);
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("cdmaCellTower"));

  }
  if (-[NSMutableArray count](self->_cdmaEvdoTowers, "count"))
  {
    v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cdmaEvdoTowers, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    cdmaEvdoTowers = self->_cdmaEvdoTowers;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v60;
      do
      {
        for (m = 0; m != v25; m = (char *)m + 1)
        {
          if (*(_QWORD *)v60 != v26)
            objc_enumerationMutation(cdmaEvdoTowers);
          objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v59, v78, 16);
      }
      while (v25);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("cdmaEvdoTower"));

  }
  if (-[NSMutableArray count](self->_lteCellTowers, "count"))
  {
    v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lteCellTowers, "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    lteCellTowers = self->_lteCellTowers;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v56;
      do
      {
        for (n = 0; n != v31; n = (char *)n + 1)
        {
          if (*(_QWORD *)v56 != v32)
            objc_enumerationMutation(lteCellTowers);
          objc_msgSend(v28, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation"));
        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v55, v77, 16);
      }
      while (v31);
    }
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("lteCellTower"));

  }
  if (-[NSMutableArray count](self->_scdmaCellTowers, "count"))
  {
    v34 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_scdmaCellTowers, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v52;
      do
      {
        for (ii = 0; ii != v37; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v52 != v38)
            objc_enumerationMutation(scdmaCellTowers);
          objc_msgSend(v34, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)ii), "dictionaryRepresentation"));
        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v51, v76, 16);
      }
      while (v37);
    }
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("scdmaCellTower"));

  }
  if (-[NSMutableArray count](self->_nr5GCellTowers, "count"))
  {
    v40 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nr5GCellTowers, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v48;
      do
      {
        for (jj = 0; jj != v43; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v48 != v44)
            objc_enumerationMutation(nr5GCellTowers);
          objc_msgSend(v40, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)jj), "dictionaryRepresentation"));
        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v47, v75, 16);
      }
      while (v43);
    }
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("nr5GCellTower"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F501A4(self, (uint64_t)a3);
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
  NSMutableArray *cdmaCellTowers;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  NSMutableArray *cdmaEvdoTowers;
  id v21;
  id v22;
  uint64_t v23;
  void *m;
  NSMutableArray *lteCellTowers;
  id v26;
  id v27;
  uint64_t v28;
  void *n;
  NSMutableArray *scdmaCellTowers;
  id v31;
  id v32;
  uint64_t v33;
  void *ii;
  NSMutableArray *nr5GCellTowers;
  id v36;
  id v37;
  uint64_t v38;
  void *jj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  cellTowers = self->_cellTowers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(cellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i), 1);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v7);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  wirelessAPs = self->_wirelessAPs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(wirelessAPs);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j), 2);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v12);
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(cdmaCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k), 21);
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v17);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v53;
    do
    {
      for (m = 0; m != v22; m = (char *)m + 1)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(cdmaEvdoTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)m), 22);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
    }
    while (v22);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  lteCellTowers = self->_lteCellTowers;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v49;
    do
    {
      for (n = 0; n != v27; n = (char *)n + 1)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(lteCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)n), 23);
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
    }
    while (v27);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v45;
    do
    {
      for (ii = 0; ii != v32; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(scdmaCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)ii), 24);
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
    }
    while (v32);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v40, v68, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v41;
    do
    {
      for (jj = 0; jj != v37; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(nr5GCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)jj), 25);
      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v40, v68, 16);
    }
    while (v37);
  }
}

- (void)copyTo:(id)a3
{
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

  if (-[ALSNearbyResponse cellTowersCount](self, "cellTowersCount"))
  {
    objc_msgSend(a3, "clearCellTowers");
    v5 = -[ALSNearbyResponse cellTowersCount](self, "cellTowersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addCellTower:", -[ALSNearbyResponse cellTowerAtIndex:](self, "cellTowerAtIndex:", i));
    }
  }
  if (-[ALSNearbyResponse wirelessAPsCount](self, "wirelessAPsCount"))
  {
    objc_msgSend(a3, "clearWirelessAPs");
    v8 = -[ALSNearbyResponse wirelessAPsCount](self, "wirelessAPsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addWirelessAP:", -[ALSNearbyResponse wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j));
    }
  }
  if (-[ALSNearbyResponse cdmaCellTowersCount](self, "cdmaCellTowersCount"))
  {
    objc_msgSend(a3, "clearCdmaCellTowers");
    v11 = -[ALSNearbyResponse cdmaCellTowersCount](self, "cdmaCellTowersCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addCdmaCellTower:", -[ALSNearbyResponse cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k));
    }
  }
  if (-[ALSNearbyResponse cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount"))
  {
    objc_msgSend(a3, "clearCdmaEvdoTowers");
    v14 = -[ALSNearbyResponse cdmaEvdoTowersCount](self, "cdmaEvdoTowersCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addCdmaEvdoTower:", -[ALSNearbyResponse cdmaEvdoTowerAtIndex:](self, "cdmaEvdoTowerAtIndex:", m));
    }
  }
  if (-[ALSNearbyResponse lteCellTowersCount](self, "lteCellTowersCount"))
  {
    objc_msgSend(a3, "clearLteCellTowers");
    v17 = -[ALSNearbyResponse lteCellTowersCount](self, "lteCellTowersCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addLteCellTower:", -[ALSNearbyResponse lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", n));
    }
  }
  if (-[ALSNearbyResponse scdmaCellTowersCount](self, "scdmaCellTowersCount"))
  {
    objc_msgSend(a3, "clearScdmaCellTowers");
    v20 = -[ALSNearbyResponse scdmaCellTowersCount](self, "scdmaCellTowersCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(a3, "addScdmaCellTower:", -[ALSNearbyResponse scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", ii));
    }
  }
  if (-[ALSNearbyResponse nr5GCellTowersCount](self, "nr5GCellTowersCount"))
  {
    objc_msgSend(a3, "clearNr5GCellTowers");
    v23 = -[ALSNearbyResponse nr5GCellTowersCount](self, "nr5GCellTowersCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
        objc_msgSend(a3, "addNr5GCellTower:", -[ALSNearbyResponse nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", jj));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
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
  NSMutableArray *cdmaCellTowers;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  id v23;
  NSMutableArray *cdmaEvdoTowers;
  id v25;
  id v26;
  uint64_t v27;
  void *m;
  id v29;
  NSMutableArray *lteCellTowers;
  id v31;
  id v32;
  uint64_t v33;
  void *n;
  id v35;
  NSMutableArray *scdmaCellTowers;
  id v37;
  id v38;
  uint64_t v39;
  void *ii;
  id v41;
  NSMutableArray *nr5GCellTowers;
  id v43;
  id v44;
  uint64_t v45;
  void *jj;
  id v47;
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
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  cellTowers = self->_cellTowers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v9)
          objc_enumerationMutation(cellTowers);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addCellTower:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v8);
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  wirelessAPs = self->_wirelessAPs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v70 != v15)
          objc_enumerationMutation(wirelessAPs);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addWirelessAP:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    }
    while (v14);
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v66 != v21)
          objc_enumerationMutation(cdmaCellTowers);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdmaCellTower:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    }
    while (v20);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  cdmaEvdoTowers = self->_cdmaEvdoTowers;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v62;
    do
    {
      for (m = 0; m != v26; m = (char *)m + 1)
      {
        if (*(_QWORD *)v62 != v27)
          objc_enumerationMutation(cdmaEvdoTowers);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdmaEvdoTower:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaEvdoTowers, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    }
    while (v26);
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  lteCellTowers = self->_lteCellTowers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v58;
    do
    {
      for (n = 0; n != v32; n = (char *)n + 1)
      {
        if (*(_QWORD *)v58 != v33)
          objc_enumerationMutation(lteCellTowers);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3);
        objc_msgSend(v5, "addLteCellTower:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
    }
    while (v32);
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v53, v78, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v54;
    do
    {
      for (ii = 0; ii != v38; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v54 != v39)
          objc_enumerationMutation(scdmaCellTowers);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)ii), "copyWithZone:", a3);
        objc_msgSend(v5, "addScdmaCellTower:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v53, v78, 16);
    }
    while (v38);
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v49, v77, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v50;
    do
    {
      for (jj = 0; jj != v44; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v50 != v45)
          objc_enumerationMutation(nr5GCellTowers);
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)jj), "copyWithZone:", a3);
        objc_msgSend(v5, "addNr5GCellTower:", v47);

      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v49, v77, 16);
    }
    while (v44);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *cellTowers;
  NSMutableArray *wirelessAPs;
  NSMutableArray *cdmaCellTowers;
  NSMutableArray *cdmaEvdoTowers;
  NSMutableArray *lteCellTowers;
  NSMutableArray *scdmaCellTowers;
  NSMutableArray *nr5GCellTowers;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((_QWORD *)a3 + 3))
      || (v5 = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((_QWORD *)a3 + 7))
        || (v5 = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        cdmaCellTowers = self->_cdmaCellTowers;
        if (!((unint64_t)cdmaCellTowers | *((_QWORD *)a3 + 1))
          || (v5 = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
        {
          cdmaEvdoTowers = self->_cdmaEvdoTowers;
          if (!((unint64_t)cdmaEvdoTowers | *((_QWORD *)a3 + 2))
            || (v5 = -[NSMutableArray isEqual:](cdmaEvdoTowers, "isEqual:")) != 0)
          {
            lteCellTowers = self->_lteCellTowers;
            if (!((unint64_t)lteCellTowers | *((_QWORD *)a3 + 4))
              || (v5 = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:")) != 0)
            {
              scdmaCellTowers = self->_scdmaCellTowers;
              if (!((unint64_t)scdmaCellTowers | *((_QWORD *)a3 + 6))
                || (v5 = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:")) != 0)
              {
                nr5GCellTowers = self->_nr5GCellTowers;
                if ((unint64_t)nr5GCellTowers | *((_QWORD *)a3 + 5))
                  LOBYTE(v5) = -[NSMutableArray isEqual:](nr5GCellTowers, "isEqual:");
                else
                  LOBYTE(v5) = 1;
              }
            }
          }
        }
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
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = (unint64_t)-[NSMutableArray hash](self->_cellTowers, "hash");
  v4 = (unint64_t)-[NSMutableArray hash](self->_wirelessAPs, "hash") ^ v3;
  v5 = (unint64_t)-[NSMutableArray hash](self->_cdmaCellTowers, "hash");
  v6 = v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_cdmaEvdoTowers, "hash");
  v7 = (unint64_t)-[NSMutableArray hash](self->_lteCellTowers, "hash");
  v8 = v7 ^ (unint64_t)-[NSMutableArray hash](self->_scdmaCellTowers, "hash");
  return v6 ^ v8 ^ (unint64_t)-[NSMutableArray hash](self->_nr5GCellTowers, "hash");
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
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *m;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *n;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *ii;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *jj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v8)
          objc_enumerationMutation(v5);
        -[ALSNearbyResponse addCellTower:](self, "addCellTower:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v7);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 7);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v13)
          objc_enumerationMutation(v10);
        -[ALSNearbyResponse addWirelessAP:](self, "addWirelessAP:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v12);
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 1);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v57;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v57 != v18)
          objc_enumerationMutation(v15);
        -[ALSNearbyResponse addCdmaCellTower:](self, "addCdmaCellTower:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    }
    while (v17);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v20 = (void *)*((_QWORD *)a3 + 2);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v53;
    do
    {
      for (m = 0; m != v22; m = (char *)m + 1)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(v20);
        -[ALSNearbyResponse addCdmaEvdoTower:](self, "addCdmaEvdoTower:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
    }
    while (v22);
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v25 = (void *)*((_QWORD *)a3 + 4);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v49;
    do
    {
      for (n = 0; n != v27; n = (char *)n + 1)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v25);
        -[ALSNearbyResponse addLteCellTower:](self, "addLteCellTower:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v70, 16);
    }
    while (v27);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = (void *)*((_QWORD *)a3 + 6);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v45;
    do
    {
      for (ii = 0; ii != v32; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(v30);
        -[ALSNearbyResponse addScdmaCellTower:](self, "addScdmaCellTower:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)ii));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v69, 16);
    }
    while (v32);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v35 = (void *)*((_QWORD *)a3 + 5);
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v68, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v41;
    do
    {
      for (jj = 0; jj != v37; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(v35);
        -[ALSNearbyResponse addNr5GCellTower:](self, "addNr5GCellTower:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)jj));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v68, 16);
    }
    while (v37);
  }
}

- (NSMutableArray)cellTowers
{
  return self->_cellTowers;
}

- (void)setCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)wirelessAPs
{
  return self->_wirelessAPs;
}

- (void)setWirelessAPs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)cdmaCellTowers
{
  return self->_cdmaCellTowers;
}

- (void)setCdmaCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableArray)cdmaEvdoTowers
{
  return self->_cdmaEvdoTowers;
}

- (void)setCdmaEvdoTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
