@implementation AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet setInstances:](self, "setInstances:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet;
  -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet dealloc](&v3, sel_dealloc);
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

- (void)addInstance:(id)a3
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

- (id)instanceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_instances, "objectAtIndex:", a3);
}

+ (Class)instanceType
{
  return (Class)objc_opt_class();
}

- (void)setModelType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_modelType = a3;
}

- (void)setHasModelType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasModelType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setFallbackModelConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_fallbackModelConfidence = a3;
}

- (void)setHasFallbackModelConfidence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFallbackModelConfidence
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setConfidenceOfMostConfidentModel:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidenceOfMostConfidentModel = a3;
}

- (void)setHasConfidenceOfMostConfidentModel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidenceOfMostConfidentModel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDurationSinceLastSuccessfulTraining:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_durationSinceLastSuccessfulTraining = a3;
}

- (void)setHasDurationSinceLastSuccessfulTraining:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDurationSinceLastSuccessfulTraining
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  char has;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_instances, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_instances, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    instances = self->_instances;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(instances);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("instance"));

  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_modelType), CFSTR("modelType"));
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 2) == 0)
        goto LABEL_15;
LABEL_20:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidenceOfMostConfidentModel), CFSTR("confidenceOfMostConfidentModel"));
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_fallbackModelConfidence), CFSTR("fallbackModelConfidence"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_20;
LABEL_15:
  if ((has & 4) != 0)
LABEL_16:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_durationSinceLastSuccessfulTraining), CFSTR("durationSinceLastSuccessfulTraining"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *instances;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char has;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  instances = self->_instances;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(instances);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      return;
    goto LABEL_14;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_14:
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  char has;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 44) |= 1u;
  }
  if (-[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet instancesCount](self, "instancesCount"))
  {
    objc_msgSend(a3, "clearInstances");
    v5 = -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet instancesCount](self, "instancesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addInstance:", -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet instanceAtIndex:](self, "instanceAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_modelType;
    *((_BYTE *)a3 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 6) = self->_fallbackModelConfidence;
  *((_BYTE *)a3 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      return;
    goto LABEL_11;
  }
LABEL_15:
  *((_DWORD *)a3 + 4) = self->_confidenceOfMostConfidentModel;
  *((_BYTE *)a3 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return;
LABEL_11:
  *((_DWORD *)a3 + 5) = self->_durationSinceLastSuccessfulTraining;
  *((_BYTE *)a3 + 44) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *instances;
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
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  instances = self->_instances;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(instances);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addInstance:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](instances, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_modelType;
    *(_BYTE *)(v6 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 2) == 0)
        goto LABEL_13;
LABEL_18:
      *(_DWORD *)(v6 + 16) = self->_confidenceOfMostConfidentModel;
      *(_BYTE *)(v6 + 44) |= 2u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        return (id)v6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 24) = self->_fallbackModelConfidence;
  *(_BYTE *)(v6 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 4) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 20) = self->_durationSinceLastSuccessfulTraining;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSMutableArray *instances;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    instances = self->_instances;
    if ((unint64_t)instances | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSMutableArray isEqual:](instances, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_modelType != *((_DWORD *)a3 + 10))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_fallbackModelConfidence != *((_DWORD *)a3 + 6))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_confidenceOfMostConfidentModel != *((_DWORD *)a3 + 4))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 44) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_durationSinceLastSuccessfulTraining != *((_DWORD *)a3 + 5))
        goto LABEL_29;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_instances, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_modelType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_fallbackModelConfidence;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_confidenceOfMostConfidentModel;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_durationSinceLastSuccessfulTraining;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramSet addInstance:](self, "addInstance:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = *((_BYTE *)a3 + 44);
  if ((v10 & 0x10) != 0)
  {
    self->_modelType = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v10 = *((_BYTE *)a3 + 44);
    if ((v10 & 8) == 0)
    {
LABEL_12:
      if ((v10 & 2) == 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 8) == 0)
  {
    goto LABEL_12;
  }
  self->_fallbackModelConfidence = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v10 = *((_BYTE *)a3 + 44);
  if ((v10 & 2) == 0)
  {
LABEL_13:
    if ((v10 & 4) == 0)
      return;
    goto LABEL_14;
  }
LABEL_18:
  self->_confidenceOfMostConfidentModel = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 44) & 4) == 0)
    return;
LABEL_14:
  self->_durationSinceLastSuccessfulTraining = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 4u;
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
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int)modelType
{
  return self->_modelType;
}

- (int)fallbackModelConfidence
{
  return self->_fallbackModelConfidence;
}

- (int)confidenceOfMostConfidentModel
{
  return self->_confidenceOfMostConfidentModel;
}

- (int)durationSinceLastSuccessfulTraining
{
  return self->_durationSinceLastSuccessfulTraining;
}

@end
