@implementation AWDCoreRoutineLMPScoreBoard

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLMPScoreBoard setInstances:](self, "setInstances:", 0);
  -[AWDCoreRoutineLMPScoreBoard setSecondaryInstances:](self, "setSecondaryInstances:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoard;
  -[AWDCoreRoutineLMPScoreBoard dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
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

- (void)clearSecondaryInstances
{
  -[NSMutableArray removeAllObjects](self->_secondaryInstances, "removeAllObjects");
}

- (void)addSecondaryInstances:(id)a3
{
  NSMutableArray *secondaryInstances;

  secondaryInstances = self->_secondaryInstances;
  if (!secondaryInstances)
  {
    secondaryInstances = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_secondaryInstances = secondaryInstances;
  }
  -[NSMutableArray addObject:](secondaryInstances, "addObject:", a3);
}

- (unint64_t)secondaryInstancesCount
{
  return -[NSMutableArray count](self->_secondaryInstances, "count");
}

- (id)secondaryInstancesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_secondaryInstances, "objectAtIndex:", a3);
}

+ (Class)secondaryInstancesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPScoreBoard;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLMPScoreBoard description](&v3, sel_description), -[AWDCoreRoutineLMPScoreBoard dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *instances;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *secondaryInstances;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_instances, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_instances, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    instances = self->_instances;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(instances);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("instances"));

  }
  if (-[NSMutableArray count](self->_secondaryInstances, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_secondaryInstances, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    secondaryInstances = self->_secondaryInstances;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](secondaryInstances, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(secondaryInstances);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](secondaryInstances, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("secondary_instances"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPScoreBoardReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *instances;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *secondaryInstances;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  instances = self->_instances;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(instances);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  secondaryInstances = self->_secondaryInstances;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](secondaryInstances, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(secondaryInstances);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](secondaryInstances, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (-[AWDCoreRoutineLMPScoreBoard instancesCount](self, "instancesCount"))
  {
    objc_msgSend(a3, "clearInstances");
    v5 = -[AWDCoreRoutineLMPScoreBoard instancesCount](self, "instancesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addInstances:", -[AWDCoreRoutineLMPScoreBoard instancesAtIndex:](self, "instancesAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineLMPScoreBoard secondaryInstancesCount](self, "secondaryInstancesCount"))
  {
    objc_msgSend(a3, "clearSecondaryInstances");
    v8 = -[AWDCoreRoutineLMPScoreBoard secondaryInstancesCount](self, "secondaryInstancesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addSecondaryInstances:", -[AWDCoreRoutineLMPScoreBoard secondaryInstancesAtIndex:](self, "secondaryInstancesAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *instances;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *secondaryInstances;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  instances = self->_instances;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(instances);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addInstances:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  secondaryInstances = self->_secondaryInstances;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](secondaryInstances, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(secondaryInstances);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addSecondaryInstances:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](secondaryInstances, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *instances;
  NSMutableArray *secondaryInstances;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    instances = self->_instances;
    if (!((unint64_t)instances | *((_QWORD *)a3 + 2))
      || (v5 = -[NSMutableArray isEqual:](instances, "isEqual:")) != 0)
    {
      secondaryInstances = self->_secondaryInstances;
      if ((unint64_t)secondaryInstances | *((_QWORD *)a3 + 3))
        LOBYTE(v5) = -[NSMutableArray isEqual:](secondaryInstances, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_instances, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_secondaryInstances, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
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
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[AWDCoreRoutineLMPScoreBoard addInstances:](self, "addInstances:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[AWDCoreRoutineLMPScoreBoard addSecondaryInstances:](self, "addSecondaryInstances:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)secondaryInstances
{
  return self->_secondaryInstances;
}

- (void)setSecondaryInstances:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
