@implementation AWDProactiveModelFittingMinibatchStats

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("size");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingMinibatchStats batchSize](self, "batchSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("support");
  v9[0] = v3;
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[AWDProactiveModelFittingMinibatchStats support](self, "support");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSupport:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_support = a3;
}

- (void)setHasSupport:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupport
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBatchSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_batchSize = a3;
}

- (void)setHasBatchSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBatchSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearPerLabelSupports
{
  -[NSMutableArray removeAllObjects](self->_perLabelSupports, "removeAllObjects");
}

- (void)addPerLabelSupport:(id)a3
{
  id v4;
  NSMutableArray *perLabelSupports;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  perLabelSupports = self->_perLabelSupports;
  v8 = v4;
  if (!perLabelSupports)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_perLabelSupports;
    self->_perLabelSupports = v6;

    v4 = v8;
    perLabelSupports = self->_perLabelSupports;
  }
  -[NSMutableArray addObject:](perLabelSupports, "addObject:", v4);

}

- (unint64_t)perLabelSupportsCount
{
  return -[NSMutableArray count](self->_perLabelSupports, "count");
}

- (id)perLabelSupportAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_perLabelSupports, "objectAtIndex:", a3);
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
  v8.super_class = (Class)AWDProactiveModelFittingMinibatchStats;
  -[AWDProactiveModelFittingMinibatchStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingMinibatchStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_support;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("support"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_batchSize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("batchSize"));

  }
  if (-[NSMutableArray count](self->_perLabelSupports, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_perLabelSupports, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_perLabelSupports;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("perLabelSupport"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_perLabelSupports;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = LODWORD(self->_support);
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_batchSize;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v10 = v4;
  if (-[AWDProactiveModelFittingMinibatchStats perLabelSupportsCount](self, "perLabelSupportsCount"))
  {
    objc_msgSend(v10, "clearPerLabelSupports");
    v6 = -[AWDProactiveModelFittingMinibatchStats perLabelSupportsCount](self, "perLabelSupportsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDProactiveModelFittingMinibatchStats perLabelSupportAtIndex:](self, "perLabelSupportAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addPerLabelSupport:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 24) = self->_support;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_batchSize;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_perLabelSupports;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addPerLabelSupport:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *perLabelSupports;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_support != *((float *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_batchSize != *((_QWORD *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }
  perLabelSupports = self->_perLabelSupports;
  if ((unint64_t)perLabelSupports | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](perLabelSupports, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float support;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    support = self->_support;
    v6 = support;
    if (support < 0.0)
      v6 = -support;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 1) != 0)
    v9 = 2654435761u * self->_batchSize;
  else
    v9 = 0;
  return v9 ^ v4 ^ -[NSMutableArray hash](self->_perLabelSupports, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  v5 = v4;
  v6 = *((_BYTE *)v4 + 28);
  if ((v6 & 2) != 0)
  {
    self->_support = *((float *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 28);
  }
  if ((v6 & 1) != 0)
  {
    self->_batchSize = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
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
        -[AWDProactiveModelFittingMinibatchStats addPerLabelSupport:](self, "addPerLabelSupport:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (float)support
{
  return self->_support;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSMutableArray)perLabelSupports
{
  return self->_perLabelSupports;
}

- (void)setPerLabelSupports:(id)a3
{
  objc_storeStrong((id *)&self->_perLabelSupports, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perLabelSupports, 0);
}

+ (Class)perLabelSupportType
{
  return (Class)objc_opt_class();
}

- (float)supportForLabel:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  float v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AWDProactiveModelFittingMinibatchStats perLabelSupports](self, "perLabelSupports", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "label") == a3)
        {
          objc_msgSend(v10, "support");
          v6 = v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)combineWithStats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[AWDProactiveModelFittingMinibatchStats perLabelSupports](self, "perLabelSupports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  collectPerLabelCounts(v6, -[AWDProactiveModelFittingMinibatchStats batchSize](self, "batchSize"), v5);

  objc_msgSend(v4, "perLabelSupports");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "batchSize");

  collectPerLabelCounts(v7, v8, v5);
  +[AWDProactiveModelFittingMinibatchStats statsWithPerLabelCounts:](AWDProactiveModelFittingMinibatchStats, "statsWithPerLabelCounts:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (AWDProactiveModelFittingMinibatchStats)statsWithPerLabelCounts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v4, "setBatchSize:", v8);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__AWDProactiveModelFittingMinibatchStats_VisibleForTesting__statsWithPerLabelCounts___block_invoke;
  v13[3] = &unk_24D3DBEF8;
  v15 = v8;
  v11 = v4;
  v14 = v11;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);

  return (AWDProactiveModelFittingMinibatchStats *)v11;
}

void __85__AWDProactiveModelFittingMinibatchStats_VisibleForTesting__statsWithPerLabelCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  float v8;
  float v9;
  double v10;
  id v11;

  v5 = a3;
  v6 = a2;
  v11 = (id)objc_opt_new();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v11, "setLabel:", v7);
  objc_msgSend(v5, "floatValue");
  v9 = v8;

  *(float *)&v10 = v9 / (float)*(unint64_t *)(a1 + 40);
  objc_msgSend(v11, "setSupport:", v10);
  objc_msgSend(*(id *)(a1 + 32), "addPerLabelSupport:", v11);

}

+ (AWDProactiveModelFittingMinibatchStats)statsWithSize:(unint64_t)a3 support:(float)a4
{
  void *v6;
  double v7;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setBatchSize:", a3);
  *(float *)&v7 = a4;
  objc_msgSend(v6, "setSupport:", v7);
  return (AWDProactiveModelFittingMinibatchStats *)v6;
}

@end
