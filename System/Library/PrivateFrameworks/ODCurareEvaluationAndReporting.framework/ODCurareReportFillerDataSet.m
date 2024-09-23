@implementation ODCurareReportFillerDataSet

- (void)clearStats
{
  -[NSMutableArray removeAllObjects](self->_stats, "removeAllObjects");
}

- (void)addStats:(id)a3
{
  id v4;
  NSMutableArray *stats;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stats = self->_stats;
  v8 = v4;
  if (!stats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_stats;
    self->_stats = v6;

    v4 = v8;
    stats = self->_stats;
  }
  -[NSMutableArray addObject:](stats, "addObject:", v4);

}

- (unint64_t)statsCount
{
  return -[NSMutableArray count](self->_stats, "count");
}

- (id)statsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stats, "objectAtIndex:", a3);
}

+ (Class)statsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSampleStartDate
{
  return self->_sampleStartDate != 0;
}

- (BOOL)hasSampleEndDate
{
  return self->_sampleEndDate != 0;
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
  v8.super_class = (Class)ODCurareReportFillerDataSet;
  -[ODCurareReportFillerDataSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerDataSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ODCurareReportFillerDataSetSize *size;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *sampleStartDate;
  NSString *sampleEndDate;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  size = self->_size;
  if (size)
  {
    -[ODCurareReportFillerDataSetSize dictionaryRepresentation](size, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("size"));

  }
  if (-[NSMutableArray count](self->_stats, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_stats, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_stats;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("stats"));
  }
  sampleStartDate = self->_sampleStartDate;
  if (sampleStartDate)
    objc_msgSend(v3, "setObject:forKey:", sampleStartDate, CFSTR("sampleStartDate"));
  sampleEndDate = self->_sampleEndDate;
  if (sampleEndDate)
    objc_msgSend(v3, "setObject:forKey:", sampleEndDate, CFSTR("sampleEndDate"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerDataSetReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_size)
    -[ODCurareReportFillerDataSet writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_stats;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_sampleStartDate)
    PBDataWriterWriteStringField();
  if (self->_sampleEndDate)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setSize:", self->_size);
  if (-[ODCurareReportFillerDataSet statsCount](self, "statsCount"))
  {
    objc_msgSend(v9, "clearStats");
    v4 = -[ODCurareReportFillerDataSet statsCount](self, "statsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ODCurareReportFillerDataSet statsAtIndex:](self, "statsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addStats:", v7);

      }
    }
  }
  if (self->_sampleStartDate)
    objc_msgSend(v9, "setSampleStartDate:");
  v8 = v9;
  if (self->_sampleEndDate)
  {
    objc_msgSend(v9, "setSampleEndDate:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ODCurareReportFillerDataSetSize copyWithZone:](self->_size, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_stats;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addStats:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_sampleStartDate, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[NSString copyWithZone:](self->_sampleEndDate, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ODCurareReportFillerDataSetSize *size;
  NSMutableArray *stats;
  NSString *sampleStartDate;
  NSString *sampleEndDate;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((size = self->_size, !((unint64_t)size | v4[3]))
     || -[ODCurareReportFillerDataSetSize isEqual:](size, "isEqual:"))
    && ((stats = self->_stats, !((unint64_t)stats | v4[4]))
     || -[NSMutableArray isEqual:](stats, "isEqual:"))
    && ((sampleStartDate = self->_sampleStartDate, !((unint64_t)sampleStartDate | v4[2]))
     || -[NSString isEqual:](sampleStartDate, "isEqual:")))
  {
    sampleEndDate = self->_sampleEndDate;
    if ((unint64_t)sampleEndDate | v4[1])
      v9 = -[NSString isEqual:](sampleEndDate, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[ODCurareReportFillerDataSetSize hash](self->_size, "hash");
  v4 = -[NSMutableArray hash](self->_stats, "hash") ^ v3;
  v5 = -[NSString hash](self->_sampleStartDate, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_sampleEndDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ODCurareReportFillerDataSetSize *size;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  size = self->_size;
  v6 = *((_QWORD *)v4 + 3);
  if (size)
  {
    if (v6)
      -[ODCurareReportFillerDataSetSize mergeFrom:](size, "mergeFrom:");
  }
  else if (v6)
  {
    -[ODCurareReportFillerDataSet setSize:](self, "setSize:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[ODCurareReportFillerDataSet addStats:](self, "addStats:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v4 + 2))
    -[ODCurareReportFillerDataSet setSampleStartDate:](self, "setSampleStartDate:");
  if (*((_QWORD *)v4 + 1))
    -[ODCurareReportFillerDataSet setSampleEndDate:](self, "setSampleEndDate:");

}

- (ODCurareReportFillerDataSetSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (NSMutableArray)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (NSString)sampleStartDate
{
  return self->_sampleStartDate;
}

- (void)setSampleStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_sampleStartDate, a3);
}

- (NSString)sampleEndDate
{
  return self->_sampleEndDate;
}

- (void)setSampleEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_sampleEndDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_sampleStartDate, 0);
  objc_storeStrong((id *)&self->_sampleEndDate, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerDataSet writeTo:]", "ODCurareReportFillerDataSet.m", 169, "self->_size != nil");
}

@end
