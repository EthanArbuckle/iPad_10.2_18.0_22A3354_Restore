@implementation AWDMETRICSCellularPowerLogHistogram

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

- (void)clearBins
{
  -[NSMutableArray removeAllObjects](self->_bins, "removeAllObjects");
}

- (void)addBin:(id)a3
{
  id v4;
  NSMutableArray *bins;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  bins = self->_bins;
  v8 = v4;
  if (!bins)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_bins;
    self->_bins = v6;

    v4 = v8;
    bins = self->_bins;
  }
  -[NSMutableArray addObject:](bins, "addObject:", v4);

}

- (unint64_t)binsCount
{
  return -[NSMutableArray count](self->_bins, "count");
}

- (id)binAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_bins, "objectAtIndex:", a3);
}

+ (Class)binType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)AWDMETRICSCellularPowerLogHistogram;
  -[AWDMETRICSCellularPowerLogHistogram description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDMETRICSCellularPowerLogHistogram dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_bins, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_bins, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_bins;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bin"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_subsId);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subs_id"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_durationMs);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("duration_ms"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogHistogramReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_bins;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v10 = v4;
  if (-[AWDMETRICSCellularPowerLogHistogram binsCount](self, "binsCount"))
  {
    objc_msgSend(v10, "clearBins");
    v5 = -[AWDMETRICSCellularPowerLogHistogram binsCount](self, "binsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[AWDMETRICSCellularPowerLogHistogram binAtIndex:](self, "binAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addBin:", v8);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v10 + 7) = self->_subsId;
    *((_BYTE *)v10 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 6) = self->_durationMs;
    *((_BYTE *)v10 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_bins;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addBin:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_subsId;
    *(_BYTE *)(v6 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_durationMs;
    *(_BYTE *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSMutableArray *bins;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }
  bins = self->_bins;
  if ((unint64_t)bins | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](bins, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 7))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  v7 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 6))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_bins, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_subsId;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_durationMs;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[AWDMETRICSCellularPowerLogHistogram addBin:](self, "addBin:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v5 + 32);
  if ((v11 & 4) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v11 = *((_BYTE *)v5 + 32);
  }
  if ((v11 & 2) != 0)
  {
    self->_durationMs = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)bins
{
  return self->_bins;
}

- (void)setBins:(id)a3
{
  objc_storeStrong((id *)&self->_bins, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bins, 0);
}

@end
