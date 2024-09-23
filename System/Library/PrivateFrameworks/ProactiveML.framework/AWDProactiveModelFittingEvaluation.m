@implementation AWDProactiveModelFittingEvaluation

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

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (void)clearPrecisionAtKs
{
  -[NSMutableArray removeAllObjects](self->_precisionAtKs, "removeAllObjects");
}

- (void)addPrecisionAtK:(id)a3
{
  id v4;
  NSMutableArray *precisionAtKs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  precisionAtKs = self->_precisionAtKs;
  v8 = v4;
  if (!precisionAtKs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_precisionAtKs;
    self->_precisionAtKs = v6;

    v4 = v8;
    precisionAtKs = self->_precisionAtKs;
  }
  -[NSMutableArray addObject:](precisionAtKs, "addObject:", v4);

}

- (unint64_t)precisionAtKsCount
{
  return -[NSMutableArray count](self->_precisionAtKs, "count");
}

- (id)precisionAtKAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_precisionAtKs, "objectAtIndex:", a3);
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
  v8.super_class = (Class)AWDProactiveModelFittingEvaluation;
  -[AWDProactiveModelFittingEvaluation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingEvaluation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  void *v6;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  void *v8;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    -[AWDProactiveModelFittingModelInfo dictionaryRepresentation](modelInfo, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("modelInfo"));

  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    -[AWDProactiveModelFittingMinibatchStats dictionaryRepresentation](minibatchStats, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("minibatchStats"));

  }
  evaluationMetrics = self->_evaluationMetrics;
  if (evaluationMetrics)
  {
    -[AWDProactiveModelFittingEvalMetrics dictionaryRepresentation](evaluationMetrics, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("evaluationMetrics"));

  }
  if (-[NSMutableArray count](self->_precisionAtKs, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_precisionAtKs, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = self->_precisionAtKs;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("precisionAtK"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingEvaluationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_modelInfo)
    PBDataWriterWriteSubmessage();
  if (self->_minibatchStats)
    PBDataWriterWriteSubmessage();
  if (self->_evaluationMetrics)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_precisionAtKs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v9 = v4;
  if (self->_modelInfo)
    objc_msgSend(v4, "setModelInfo:");
  if (self->_minibatchStats)
    objc_msgSend(v9, "setMinibatchStats:");
  if (self->_evaluationMetrics)
    objc_msgSend(v9, "setEvaluationMetrics:");
  if (-[AWDProactiveModelFittingEvaluation precisionAtKsCount](self, "precisionAtKsCount"))
  {
    objc_msgSend(v9, "clearPrecisionAtKs");
    v5 = -[AWDProactiveModelFittingEvaluation precisionAtKsCount](self, "precisionAtKsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[AWDProactiveModelFittingEvaluation precisionAtKAtIndex:](self, "precisionAtKAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addPrecisionAtK:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[AWDProactiveModelFittingModelInfo copyWithZone:](self->_modelInfo, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[AWDProactiveModelFittingMinibatchStats copyWithZone:](self->_minibatchStats, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[AWDProactiveModelFittingEvalMetrics copyWithZone:](self->_evaluationMetrics, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_precisionAtKs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addPrecisionAtK:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  NSMutableArray *precisionAtKs;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((_QWORD *)v4 + 4)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_15;
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((_QWORD *)v4 + 3))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:"))
      goto LABEL_15;
  }
  evaluationMetrics = self->_evaluationMetrics;
  if ((unint64_t)evaluationMetrics | *((_QWORD *)v4 + 2))
  {
    if (!-[AWDProactiveModelFittingEvalMetrics isEqual:](evaluationMetrics, "isEqual:"))
      goto LABEL_15;
  }
  precisionAtKs = self->_precisionAtKs;
  if ((unint64_t)precisionAtKs | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](precisionAtKs, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDProactiveModelFittingModelInfo hash](self->_modelInfo, "hash") ^ v3;
  v5 = -[AWDProactiveModelFittingMinibatchStats hash](self->_minibatchStats, "hash");
  v6 = v4 ^ v5 ^ -[AWDProactiveModelFittingEvalMetrics hash](self->_evaluationMetrics, "hash");
  return v6 ^ -[NSMutableArray hash](self->_precisionAtKs, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  AWDProactiveModelFittingModelInfo *modelInfo;
  uint64_t v7;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  uint64_t v9;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  modelInfo = self->_modelInfo;
  v7 = *((_QWORD *)v5 + 4);
  if (modelInfo)
  {
    if (v7)
      -[AWDProactiveModelFittingModelInfo mergeFrom:](modelInfo, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDProactiveModelFittingEvaluation setModelInfo:](self, "setModelInfo:");
  }
  minibatchStats = self->_minibatchStats;
  v9 = *((_QWORD *)v5 + 3);
  if (minibatchStats)
  {
    if (v9)
      -[AWDProactiveModelFittingMinibatchStats mergeFrom:](minibatchStats, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDProactiveModelFittingEvaluation setMinibatchStats:](self, "setMinibatchStats:");
  }
  evaluationMetrics = self->_evaluationMetrics;
  v11 = *((_QWORD *)v5 + 2);
  if (evaluationMetrics)
  {
    if (v11)
      -[AWDProactiveModelFittingEvalMetrics mergeFrom:](evaluationMetrics, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDProactiveModelFittingEvaluation setEvaluationMetrics:](self, "setEvaluationMetrics:");
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *((id *)v5 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[AWDProactiveModelFittingEvaluation addPrecisionAtK:](self, "addPrecisionAtK:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void)setModelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_modelInfo, a3);
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setMinibatchStats:(id)a3
{
  objc_storeStrong((id *)&self->_minibatchStats, a3);
}

- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics
{
  return self->_evaluationMetrics;
}

- (void)setEvaluationMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetrics, a3);
}

- (NSMutableArray)precisionAtKs
{
  return self->_precisionAtKs;
}

- (void)setPrecisionAtKs:(id)a3
{
  objc_storeStrong((id *)&self->_precisionAtKs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionAtKs, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
}

+ (Class)precisionAtKType
{
  return (Class)objc_opt_class();
}

- (float)precisionAtK:(unint64_t)a3
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
  -[AWDProactiveModelFittingEvaluation precisionAtKs](self, "precisionAtKs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v6 = -1.0;
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
        if (objc_msgSend(v10, "k") == a3)
        {
          objc_msgSend(v10, "precision");
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

@end
