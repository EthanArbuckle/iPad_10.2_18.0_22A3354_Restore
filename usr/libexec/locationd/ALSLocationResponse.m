@implementation ALSLocationResponse

- (void)dealloc
{
  objc_super v3;

  -[ALSLocationResponse setCellTowers:](self, "setCellTowers:", 0);
  -[ALSLocationResponse setWirelessAPs:](self, "setWirelessAPs:", 0);
  -[ALSLocationResponse setCdmaCellTowers:](self, "setCdmaCellTowers:", 0);
  -[ALSLocationResponse setLteCellTowers:](self, "setLteCellTowers:", 0);
  -[ALSLocationResponse setScdmaCellTowers:](self, "setScdmaCellTowers:", 0);
  -[ALSLocationResponse setNr5GCellTowers:](self, "setNr5GCellTowers:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSLocationResponse;
  -[ALSLocationResponse dealloc](&v3, "dealloc");
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
  v3.super_class = (Class)ALSLocationResponse;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSLocationResponse description](&v3, "description"), -[ALSLocationResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  NSMutableArray *lteCellTowers;
  id v24;
  id v25;
  uint64_t v26;
  void *m;
  id v28;
  NSMutableArray *scdmaCellTowers;
  id v30;
  id v31;
  uint64_t v32;
  void *n;
  id v34;
  NSMutableArray *nr5GCellTowers;
  id v36;
  id v37;
  uint64_t v38;
  void *ii;
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
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_cellTowers, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cellTowers, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    cellTowers = self->_cellTowers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v8)
            objc_enumerationMutation(cellTowers);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("cellTower"));

  }
  if (-[NSMutableArray count](self->_wirelessAPs, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_wirelessAPs, "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    wirelessAPs = self->_wirelessAPs;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v58 != v14)
            objc_enumerationMutation(wirelessAPs);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("wirelessAP"));

  }
  if (-[NSMutableArray count](self->_cdmaCellTowers, "count"))
  {
    v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cdmaCellTowers, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    cdmaCellTowers = self->_cdmaCellTowers;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v19; k = (char *)k + 1)
        {
          if (*(_QWORD *)v54 != v20)
            objc_enumerationMutation(cdmaCellTowers);
          objc_msgSend(v16, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
      }
      while (v19);
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("cdmaCellTower"));

  }
  if (-[NSMutableArray count](self->_lteCellTowers, "count"))
  {
    v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lteCellTowers, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    lteCellTowers = self->_lteCellTowers;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v50;
      do
      {
        for (m = 0; m != v25; m = (char *)m + 1)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(lteCellTowers);
          objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
      }
      while (v25);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("lteCellTower"));

  }
  if (-[NSMutableArray count](self->_scdmaCellTowers, "count"))
  {
    v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_scdmaCellTowers, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    scdmaCellTowers = self->_scdmaCellTowers;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v46;
      do
      {
        for (n = 0; n != v31; n = (char *)n + 1)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(scdmaCellTowers);
          objc_msgSend(v28, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation"));
        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v45, v66, 16);
      }
      while (v31);
    }
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("scdmaCellTower"));

  }
  if (-[NSMutableArray count](self->_nr5GCellTowers, "count"))
  {
    v34 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nr5GCellTowers, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    nr5GCellTowers = self->_nr5GCellTowers;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v42;
      do
      {
        for (ii = 0; ii != v37; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v42 != v38)
            objc_enumerationMutation(nr5GCellTowers);
          objc_msgSend(v34, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)ii), "dictionaryRepresentation"));
        }
        v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v41, v65, 16);
      }
      while (v37);
    }
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("nr5GCellTower"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F08A7C(self, (uint64_t)a3);
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
  NSMutableArray *lteCellTowers;
  id v21;
  id v22;
  uint64_t v23;
  void *m;
  NSMutableArray *scdmaCellTowers;
  id v26;
  id v27;
  uint64_t v28;
  void *n;
  NSMutableArray *nr5GCellTowers;
  id v31;
  id v32;
  uint64_t v33;
  void *ii;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];

  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  cellTowers = self->_cellTowers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(cellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), 1);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v7);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  wirelessAPs = self->_wirelessAPs;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(wirelessAPs);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j), 2);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v12);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(cdmaCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k), 21);
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v17);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  lteCellTowers = self->_lteCellTowers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v22; m = (char *)m + 1)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(lteCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)m), 22);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    }
    while (v22);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v27; n = (char *)n + 1)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(scdmaCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)n), 23);
      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    }
    while (v27);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (ii = 0; ii != v32; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(nr5GCellTowers);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)ii), 24);
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v32);
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

  if (-[ALSLocationResponse cellTowersCount](self, "cellTowersCount"))
  {
    objc_msgSend(a3, "clearCellTowers");
    v5 = -[ALSLocationResponse cellTowersCount](self, "cellTowersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addCellTower:", -[ALSLocationResponse cellTowerAtIndex:](self, "cellTowerAtIndex:", i));
    }
  }
  if (-[ALSLocationResponse wirelessAPsCount](self, "wirelessAPsCount"))
  {
    objc_msgSend(a3, "clearWirelessAPs");
    v8 = -[ALSLocationResponse wirelessAPsCount](self, "wirelessAPsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addWirelessAP:", -[ALSLocationResponse wirelessAPAtIndex:](self, "wirelessAPAtIndex:", j));
    }
  }
  if (-[ALSLocationResponse cdmaCellTowersCount](self, "cdmaCellTowersCount"))
  {
    objc_msgSend(a3, "clearCdmaCellTowers");
    v11 = -[ALSLocationResponse cdmaCellTowersCount](self, "cdmaCellTowersCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(a3, "addCdmaCellTower:", -[ALSLocationResponse cdmaCellTowerAtIndex:](self, "cdmaCellTowerAtIndex:", k));
    }
  }
  if (-[ALSLocationResponse lteCellTowersCount](self, "lteCellTowersCount"))
  {
    objc_msgSend(a3, "clearLteCellTowers");
    v14 = -[ALSLocationResponse lteCellTowersCount](self, "lteCellTowersCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(a3, "addLteCellTower:", -[ALSLocationResponse lteCellTowerAtIndex:](self, "lteCellTowerAtIndex:", m));
    }
  }
  if (-[ALSLocationResponse scdmaCellTowersCount](self, "scdmaCellTowersCount"))
  {
    objc_msgSend(a3, "clearScdmaCellTowers");
    v17 = -[ALSLocationResponse scdmaCellTowersCount](self, "scdmaCellTowersCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(a3, "addScdmaCellTower:", -[ALSLocationResponse scdmaCellTowerAtIndex:](self, "scdmaCellTowerAtIndex:", n));
    }
  }
  if (-[ALSLocationResponse nr5GCellTowersCount](self, "nr5GCellTowersCount"))
  {
    objc_msgSend(a3, "clearNr5GCellTowers");
    v20 = -[ALSLocationResponse nr5GCellTowersCount](self, "nr5GCellTowersCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(a3, "addNr5GCellTower:", -[ALSLocationResponse nr5GCellTowerAtIndex:](self, "nr5GCellTowerAtIndex:", ii));
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
  NSMutableArray *lteCellTowers;
  id v25;
  id v26;
  uint64_t v27;
  void *m;
  id v29;
  NSMutableArray *scdmaCellTowers;
  id v31;
  id v32;
  uint64_t v33;
  void *n;
  id v35;
  NSMutableArray *nr5GCellTowers;
  id v37;
  id v38;
  uint64_t v39;
  void *ii;
  id v41;
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
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  cellTowers = self->_cellTowers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(cellTowers);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addCellTower:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cellTowers, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v8);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  wirelessAPs = self->_wirelessAPs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v60 != v15)
          objc_enumerationMutation(wirelessAPs);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addWirelessAP:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](wirelessAPs, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v14);
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  cdmaCellTowers = self->_cdmaCellTowers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v56 != v21)
          objc_enumerationMutation(cdmaCellTowers);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v5, "addCdmaCellTower:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v55, v70, 16);
    }
    while (v20);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  lteCellTowers = self->_lteCellTowers;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v26; m = (char *)m + 1)
      {
        if (*(_QWORD *)v52 != v27)
          objc_enumerationMutation(lteCellTowers);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v5, "addLteCellTower:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](lteCellTowers, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    }
    while (v26);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  scdmaCellTowers = self->_scdmaCellTowers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v47, v68, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v48;
    do
    {
      for (n = 0; n != v32; n = (char *)n + 1)
      {
        if (*(_QWORD *)v48 != v33)
          objc_enumerationMutation(scdmaCellTowers);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3);
        objc_msgSend(v5, "addScdmaCellTower:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](scdmaCellTowers, "countByEnumeratingWithState:objects:count:", &v47, v68, 16);
    }
    while (v32);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  nr5GCellTowers = self->_nr5GCellTowers;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v43, v67, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      for (ii = 0; ii != v38; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(nr5GCellTowers);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)ii), "copyWithZone:", a3);
        objc_msgSend(v5, "addNr5GCellTower:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](nr5GCellTowers, "countByEnumeratingWithState:objects:count:", &v43, v67, 16);
    }
    while (v38);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *cellTowers;
  NSMutableArray *wirelessAPs;
  NSMutableArray *cdmaCellTowers;
  NSMutableArray *lteCellTowers;
  NSMutableArray *scdmaCellTowers;
  NSMutableArray *nr5GCellTowers;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    cellTowers = self->_cellTowers;
    if (!((unint64_t)cellTowers | *((_QWORD *)a3 + 2))
      || (v5 = -[NSMutableArray isEqual:](cellTowers, "isEqual:")) != 0)
    {
      wirelessAPs = self->_wirelessAPs;
      if (!((unint64_t)wirelessAPs | *((_QWORD *)a3 + 6))
        || (v5 = -[NSMutableArray isEqual:](wirelessAPs, "isEqual:")) != 0)
      {
        cdmaCellTowers = self->_cdmaCellTowers;
        if (!((unint64_t)cdmaCellTowers | *((_QWORD *)a3 + 1))
          || (v5 = -[NSMutableArray isEqual:](cdmaCellTowers, "isEqual:")) != 0)
        {
          lteCellTowers = self->_lteCellTowers;
          if (!((unint64_t)lteCellTowers | *((_QWORD *)a3 + 3))
            || (v5 = -[NSMutableArray isEqual:](lteCellTowers, "isEqual:")) != 0)
          {
            scdmaCellTowers = self->_scdmaCellTowers;
            if (!((unint64_t)scdmaCellTowers | *((_QWORD *)a3 + 5))
              || (v5 = -[NSMutableArray isEqual:](scdmaCellTowers, "isEqual:")) != 0)
            {
              nr5GCellTowers = self->_nr5GCellTowers;
              if ((unint64_t)nr5GCellTowers | *((_QWORD *)a3 + 4))
                LOBYTE(v5) = -[NSMutableArray isEqual:](nr5GCellTowers, "isEqual:");
              else
                LOBYTE(v5) = 1;
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

  v3 = (unint64_t)-[NSMutableArray hash](self->_cellTowers, "hash");
  v4 = (unint64_t)-[NSMutableArray hash](self->_wirelessAPs, "hash") ^ v3;
  v5 = (unint64_t)-[NSMutableArray hash](self->_cdmaCellTowers, "hash");
  v6 = v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_lteCellTowers, "hash");
  v7 = (unint64_t)-[NSMutableArray hash](self->_scdmaCellTowers, "hash");
  return v6 ^ v7 ^ (unint64_t)-[NSMutableArray hash](self->_nr5GCellTowers, "hash");
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
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];

  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        -[ALSLocationResponse addCellTower:](self, "addCellTower:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v7);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        -[ALSLocationResponse addWirelessAP:](self, "addWirelessAP:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v12);
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = (void *)*((_QWORD *)a3 + 1);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v48 != v18)
          objc_enumerationMutation(v15);
        -[ALSLocationResponse addCdmaCellTower:](self, "addCdmaCellTower:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v17);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = (void *)*((_QWORD *)a3 + 3);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v22; m = (char *)m + 1)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(v20);
        -[ALSLocationResponse addLteCellTower:](self, "addLteCellTower:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)m));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    }
    while (v22);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = (void *)*((_QWORD *)a3 + 5);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v27; n = (char *)n + 1)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        -[ALSLocationResponse addScdmaCellTower:](self, "addScdmaCellTower:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)n));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v60, 16);
    }
    while (v27);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = (void *)*((_QWORD *)a3 + 4);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (ii = 0; ii != v32; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        -[ALSLocationResponse addNr5GCellTower:](self, "addNr5GCellTower:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)ii));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v32);
  }
}

- (NSMutableArray)cellTowers
{
  return self->_cellTowers;
}

- (void)setCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)wirelessAPs
{
  return self->_wirelessAPs;
}

- (void)setWirelessAPs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)cdmaCellTowers
{
  return self->_cdmaCellTowers;
}

- (void)setCdmaCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableArray)lteCellTowers
{
  return self->_lteCellTowers;
}

- (void)setLteCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)scdmaCellTowers
{
  return self->_scdmaCellTowers;
}

- (void)setScdmaCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)nr5GCellTowers
{
  return self->_nr5GCellTowers;
}

- (void)setNr5GCellTowers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
