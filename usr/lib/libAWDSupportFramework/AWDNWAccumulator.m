@implementation AWDNWAccumulator

- (void)dealloc
{
  objc_super v3;

  -[AWDNWAccumulator setName:](self, "setName:", 0);
  -[AWDNWAccumulator setDurations:](self, "setDurations:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDNWAccumulator;
  -[AWDNWAccumulator dealloc](&v3, sel_dealloc);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearDurations
{
  -[NSMutableArray removeAllObjects](self->_durations, "removeAllObjects");
}

- (void)addDurations:(id)a3
{
  NSMutableArray *durations;

  durations = self->_durations;
  if (!durations)
  {
    durations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_durations = durations;
  }
  -[NSMutableArray addObject:](durations, "addObject:", a3);
}

- (unint64_t)durationsCount
{
  return -[NSMutableArray count](self->_durations, "count");
}

- (id)durationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_durations, "objectAtIndex:", a3);
}

+ (Class)durationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDNWAccumulator;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDNWAccumulator description](&v3, sel_description), -[AWDNWAccumulator dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  void *v6;
  NSMutableArray *durations;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if (-[NSMutableArray count](self->_durations, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_durations, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    durations = self->_durations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](durations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(durations);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](durations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("durations"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWAccumulatorReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *durations;
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
  if (self->_name)
    PBDataWriterWriteStringField();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  durations = self->_durations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](durations, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_enumerationMutation(durations);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](durations, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_name)
    objc_msgSend(a3, "setName:");
  if (-[AWDNWAccumulator durationsCount](self, "durationsCount"))
  {
    objc_msgSend(a3, "clearDurations");
    v5 = -[AWDNWAccumulator durationsCount](self, "durationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addDurations:", -[AWDNWAccumulator durationsAtIndex:](self, "durationsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *durations;
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

  v5[2] = (id)-[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  durations = self->_durations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](durations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(durations);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addDurations:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](durations, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *name;
  NSMutableArray *durations;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      durations = self->_durations;
      if ((unint64_t)durations | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSMutableArray isEqual:](durations, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSMutableArray hash](self->_durations, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a3 + 2))
    -[AWDNWAccumulator setName:](self, "setName:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[AWDNWAccumulator addDurations:](self, "addDurations:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
