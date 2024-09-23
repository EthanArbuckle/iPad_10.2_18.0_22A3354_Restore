@implementation AWDPowerPerProcessCPULoadMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDPowerPerProcessCPULoadMetrics setLoads:](self, "setLoads:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerPerProcessCPULoadMetrics;
  -[AWDPowerPerProcessCPULoadMetrics dealloc](&v3, sel_dealloc);
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

- (void)clearLoads
{
  -[NSMutableArray removeAllObjects](self->_loads, "removeAllObjects");
}

- (void)addLoad:(id)a3
{
  NSMutableArray *loads;

  loads = self->_loads;
  if (!loads)
  {
    loads = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_loads = loads;
  }
  -[NSMutableArray addObject:](loads, "addObject:", a3);
}

- (unint64_t)loadsCount
{
  return -[NSMutableArray count](self->_loads, "count");
}

- (id)loadAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_loads, "objectAtIndex:", a3);
}

+ (Class)loadType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerPerProcessCPULoadMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerPerProcessCPULoadMetrics description](&v3, sel_description), -[AWDPowerPerProcessCPULoadMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *loads;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_loads, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_loads, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    loads = self->_loads;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loads, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(loads);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loads, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("load"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerPerProcessCPULoadMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *loads;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  loads = self->_loads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loads, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_enumerationMutation(loads);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loads, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  if (-[AWDPowerPerProcessCPULoadMetrics loadsCount](self, "loadsCount"))
  {
    objc_msgSend(a3, "clearLoads");
    v5 = -[AWDPowerPerProcessCPULoadMetrics loadsCount](self, "loadsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addLoad:", -[AWDPowerPerProcessCPULoadMetrics loadAtIndex:](self, "loadAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *loads;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  loads = self->_loads;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loads, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(loads);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addLoad:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](loads, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *loads;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    loads = self->_loads;
    if ((unint64_t)loads | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSMutableArray isEqual:](loads, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  return -[NSMutableArray hash](self->_loads, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  void *v4;
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
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)*((_QWORD *)a3 + 2);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_enumerationMutation(v4);
        -[AWDPowerPerProcessCPULoadMetrics addLoad:](self, "addLoad:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)loads
{
  return self->_loads;
}

- (void)setLoads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
