@implementation AWDCoreRoutineMagicalMomentsExpertInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicalMomentsExpertInstance setInstances:](self, "setInstances:", 0);
  -[AWDCoreRoutineMagicalMomentsExpertInstance setAddons:](self, "setAddons:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExpertInstance;
  -[AWDCoreRoutineMagicalMomentsExpertInstance dealloc](&v3, sel_dealloc);
}

- (void)setModelType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modelType = a3;
}

- (void)setHasModelType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModelType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setExpertType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expertType = a3;
}

- (void)setHasExpertType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpertType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSampleCounts:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sampleCounts = a3;
}

- (void)setHasSampleCounts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSampleCounts
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearInstances
{
  -[NSMutableArray removeAllObjects](self->_instances, "removeAllObjects");
}

- (void)addInstances:(id)a3
{
  NSMutableArray *instances;

  instances = self->_instances;
  if (!instances)
  {
    instances = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_instances = instances;
  }
  -[NSMutableArray addObject:](instances, "addObject:", a3);
}

- (unint64_t)instancesCount
{
  return -[NSMutableArray count](self->_instances, "count");
}

- (id)instancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_instances, "objectAtIndex:", a3);
}

+ (Class)instancesType
{
  return (Class)objc_opt_class();
}

- (void)clearAddons
{
  -[NSMutableArray removeAllObjects](self->_addons, "removeAllObjects");
}

- (void)addAddons:(id)a3
{
  NSMutableArray *addons;

  addons = self->_addons;
  if (!addons)
  {
    addons = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_addons = addons;
  }
  -[NSMutableArray addObject:](addons, "addObject:", a3);
}

- (unint64_t)addonsCount
{
  return -[NSMutableArray count](self->_addons, "count");
}

- (id)addonsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_addons, "objectAtIndex:", a3);
}

+ (Class)addonsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExpertInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicalMomentsExpertInstance description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsExpertInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *instances;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *addons;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_modelType), CFSTR("modelType"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_expertType), CFSTR("expertType"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidence), CFSTR("confidence"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sampleCounts), CFSTR("sampleCounts"));
LABEL_6:
  if (-[NSMutableArray count](self->_instances, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_instances, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    instances = self->_instances;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(instances);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("instances"));

  }
  if (-[NSMutableArray count](self->_addons, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_addons, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    addons = self->_addons;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addons, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(addons);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addons, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("addons"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsExpertInstanceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *instances;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *addons;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  instances = self->_instances;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(instances);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  addons = self->_addons;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addons, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(addons);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addons, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_modelType;
    *((_BYTE *)a3 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_17:
      *((_DWORD *)a3 + 4) = self->_confidence;
      *((_BYTE *)a3 + 40) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_expertType;
  *((_BYTE *)a3 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_sampleCounts;
    *((_BYTE *)a3 + 40) |= 8u;
  }
LABEL_6:
  if (-[AWDCoreRoutineMagicalMomentsExpertInstance instancesCount](self, "instancesCount"))
  {
    objc_msgSend(a3, "clearInstances");
    v6 = -[AWDCoreRoutineMagicalMomentsExpertInstance instancesCount](self, "instancesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addInstances:", -[AWDCoreRoutineMagicalMomentsExpertInstance instancesAtIndex:](self, "instancesAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineMagicalMomentsExpertInstance addonsCount](self, "addonsCount"))
  {
    objc_msgSend(a3, "clearAddons");
    v9 = -[AWDCoreRoutineMagicalMomentsExpertInstance addonsCount](self, "addonsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addAddons:", -[AWDCoreRoutineMagicalMomentsExpertInstance addonsAtIndex:](self, "addonsAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *instances;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *addons;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_modelType;
    *(_BYTE *)(v5 + 40) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_expertType;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  *(_DWORD *)(v5 + 16) = self->_confidence;
  *(_BYTE *)(v5 + 40) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_sampleCounts;
    *(_BYTE *)(v5 + 40) |= 8u;
  }
LABEL_6:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  instances = self->_instances;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(instances);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addInstances:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  addons = self->_addons;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addons, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(addons);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addAddons:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](addons, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *instances;
  NSMutableArray *addons;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 4) == 0 || self->_modelType != *((_DWORD *)a3 + 8))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 40) & 4) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 2) == 0 || self->_expertType != *((_DWORD *)a3 + 5))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 40) & 2) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_confidence != *((_DWORD *)a3 + 4))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
      goto LABEL_26;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 8) == 0 || self->_sampleCounts != *((_DWORD *)a3 + 9))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 40) & 8) != 0)
    {
      goto LABEL_26;
    }
    instances = self->_instances;
    if (!((unint64_t)instances | *((_QWORD *)a3 + 3))
      || (v5 = -[NSMutableArray isEqual:](instances, "isEqual:")) != 0)
    {
      addons = self->_addons;
      if ((unint64_t)addons | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSMutableArray isEqual:](addons, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_modelType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_expertType;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_confidence;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_sampleCounts;
LABEL_10:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_instances, "hash");
  return v7 ^ -[NSMutableArray hash](self->_addons, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_modelType = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)a3 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expertType = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  self->_confidence = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 40) & 8) != 0)
  {
LABEL_5:
    self->_sampleCounts = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[AWDCoreRoutineMagicalMomentsExpertInstance addInstances:](self, "addInstances:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 1);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[AWDCoreRoutineMagicalMomentsExpertInstance addAddons:](self, "addAddons:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
}

- (int)modelType
{
  return self->_modelType;
}

- (int)expertType
{
  return self->_expertType;
}

- (int)confidence
{
  return self->_confidence;
}

- (int)sampleCounts
{
  return self->_sampleCounts;
}

- (NSMutableArray)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)addons
{
  return self->_addons;
}

- (void)setAddons:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
