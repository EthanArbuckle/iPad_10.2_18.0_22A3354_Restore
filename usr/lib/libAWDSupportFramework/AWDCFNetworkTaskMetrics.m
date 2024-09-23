@implementation AWDCFNetworkTaskMetrics

- (void)dealloc
{
  objc_super v3;

  -[AWDCFNetworkTaskMetrics setActivityUUID:](self, "setActivityUUID:", 0);
  -[AWDCFNetworkTaskMetrics setTransactionMetrics:](self, "setTransactionMetrics:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTaskMetrics;
  -[AWDCFNetworkTaskMetrics dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasActivityUUID
{
  return self->_activityUUID != 0;
}

- (void)setTaskResume:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_taskResume = a3;
}

- (void)setHasTaskResume:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTaskResume
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDidCompleteWithError:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_didCompleteWithError = a3;
}

- (void)setHasDidCompleteWithError:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDidCompleteWithError
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumberOfRetries:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numberOfRetries = a3;
}

- (void)setHasNumberOfRetries:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumberOfRetries
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumberOfRedirects:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numberOfRedirects = a3;
}

- (void)setHasNumberOfRedirects:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumberOfRedirects
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setError:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasError
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setUnderlyingError:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_underlyingError = a3;
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUnderlyingError
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUnderlyingErrorDomain:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_underlyingErrorDomain = a3;
}

- (void)setHasUnderlyingErrorDomain:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)taskType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_taskType;
  else
    return 1;
}

- (void)setTaskType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_taskType = a3;
}

- (void)setHasTaskType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTaskType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)taskTypeAsString:(int)a3
{
  if ((a3 - 1) >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D830[a3 - 1];
}

- (int)StringAsTaskType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UNKNOWN_TASK_TYPE")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DATA_TASK")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UPLOAD_TASK")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DOWNLOAD_TASK")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("STREAM_TASK")))
    return 5;
  return 1;
}

- (void)setIsBackground:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isBackground = a3;
}

- (void)setHasIsBackground:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsBackground
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearTransactionMetrics
{
  -[NSMutableArray removeAllObjects](self->_transactionMetrics, "removeAllObjects");
}

- (void)addTransactionMetrics:(id)a3
{
  NSMutableArray *transactionMetrics;

  transactionMetrics = self->_transactionMetrics;
  if (!transactionMetrics)
  {
    transactionMetrics = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_transactionMetrics = transactionMetrics;
  }
  -[NSMutableArray addObject:](transactionMetrics, "addObject:", a3);
}

- (unint64_t)transactionMetricsCount
{
  return -[NSMutableArray count](self->_transactionMetrics, "count");
}

- (id)transactionMetricsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transactionMetrics, "objectAtIndex:", a3);
}

+ (Class)transactionMetricsType
{
  return (Class)objc_opt_class();
}

- (int)schedulingTier
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_schedulingTier;
  else
    return 1;
}

- (void)setSchedulingTier:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_schedulingTier = a3;
}

- (void)setHasSchedulingTier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSchedulingTier
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)schedulingTierAsString:(int)a3
{
  if ((a3 - 1) >= 5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D858[a3 - 1];
}

- (int)StringAsSchedulingTier:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("DISCRETIONARY")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("INFERS_DISCRETIONARY")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("USER_INITIATED")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("BACKGROUND_PLUS")))
    return 5;
  return 1;
}

- (void)setUnused:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unused = a3;
}

- (void)setHasUnused:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUnused
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCFNetworkTaskMetrics;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCFNetworkTaskMetrics description](&v3, sel_description), -[AWDCFNetworkTaskMetrics dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *activityUUID;
  __int16 has;
  void *v6;
  NSMutableArray *transactionMetrics;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int16 v12;
  unsigned int v13;
  __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  activityUUID = self->_activityUUID;
  if (activityUUID)
    objc_msgSend(v3, "setObject:forKey:", activityUUID, CFSTR("activityUUID"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_taskResume), CFSTR("taskResume"));
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_didCompleteWithError), CFSTR("didCompleteWithError"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfRetries), CFSTR("numberOfRetries"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfRedirects), CFSTR("numberOfRedirects"));
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_error), CFSTR("error"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_underlyingError), CFSTR("underlyingError"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_underlyingErrorDomain), CFSTR("underlyingErrorDomain"));
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_34:
  v15 = self->_taskType - 1;
  if (v15 >= 5)
    v16 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_taskType);
  else
    v16 = off_24C10D830[v15];
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("taskType"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBackground), CFSTR("isBackground"));
LABEL_15:
  if (-[NSMutableArray count](self->_transactionMetrics, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_transactionMetrics, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    transactionMetrics = self->_transactionMetrics;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transactionMetrics, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(transactionMetrics);
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transactionMetrics, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("transactionMetrics"));

  }
  v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    v13 = self->_schedulingTier - 1;
    if (v13 >= 5)
      v14 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_schedulingTier);
    else
      v14 = off_24C10D858[v13];
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("schedulingTier"));
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x800) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_unused), CFSTR("unused"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCFNetworkTaskMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSMutableArray *transactionMetrics;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_activityUUID)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  transactionMetrics = self->_transactionMetrics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transactionMetrics, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(transactionMetrics);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transactionMetrics, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x800) != 0)
    PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  __int16 v9;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timestamp;
    *((_WORD *)a3 + 50) |= 0x20u;
  }
  if (self->_activityUUID)
    objc_msgSend(a3, "setActivityUUID:");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)a3 + 5) = self->_taskResume;
    *((_WORD *)a3 + 50) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_26;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)a3 + 1) = self->_didCompleteWithError;
  *((_WORD *)a3 + 50) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)a3 + 4) = self->_numberOfRetries;
  *((_WORD *)a3 + 50) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a3 + 3) = self->_numberOfRedirects;
  *((_WORD *)a3 + 50) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)a3 + 2) = self->_error;
  *((_WORD *)a3 + 50) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)a3 + 7) = self->_underlyingError;
  *((_WORD *)a3 + 50) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
LABEL_31:
    *((_DWORD *)a3 + 21) = self->_taskType;
    *((_WORD *)a3 + 50) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_30:
  *((_QWORD *)a3 + 8) = self->_underlyingErrorDomain;
  *((_WORD *)a3 + 50) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_31;
LABEL_13:
  if ((has & 0x400) != 0)
  {
LABEL_14:
    *((_BYTE *)a3 + 96) = self->_isBackground;
    *((_WORD *)a3 + 50) |= 0x400u;
  }
LABEL_15:
  if (-[AWDCFNetworkTaskMetrics transactionMetricsCount](self, "transactionMetricsCount"))
  {
    objc_msgSend(a3, "clearTransactionMetrics");
    v6 = -[AWDCFNetworkTaskMetrics transactionMetricsCount](self, "transactionMetricsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addTransactionMetrics:", -[AWDCFNetworkTaskMetrics transactionMetricsAtIndex:](self, "transactionMetricsAtIndex:", i));
    }
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    *((_DWORD *)a3 + 20) = self->_schedulingTier;
    *((_WORD *)a3 + 50) |= 0x100u;
    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x800) != 0)
  {
    *((_BYTE *)a3 + 97) = self->_unused;
    *((_WORD *)a3 + 50) |= 0x800u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  NSMutableArray *transactionMetrics;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int16 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 100) |= 0x20u;
  }

  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_activityUUID, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_QWORD *)(v6 + 40) = self->_taskResume;
    *(_WORD *)(v6 + 100) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_27;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 8) = self->_didCompleteWithError;
  *(_WORD *)(v6 + 100) |= 1u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v6 + 32) = self->_numberOfRetries;
  *(_WORD *)(v6 + 100) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_29;
  }
LABEL_28:
  *(_QWORD *)(v6 + 24) = self->_numberOfRedirects;
  *(_WORD *)(v6 + 100) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  *(_QWORD *)(v6 + 16) = self->_error;
  *(_WORD *)(v6 + 100) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  *(_QWORD *)(v6 + 56) = self->_underlyingError;
  *(_WORD *)(v6 + 100) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v6 + 64) = self->_underlyingErrorDomain;
  *(_WORD *)(v6 + 100) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_32:
  *(_DWORD *)(v6 + 84) = self->_taskType;
  *(_WORD *)(v6 + 100) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    *(_BYTE *)(v6 + 96) = self->_isBackground;
    *(_WORD *)(v6 + 100) |= 0x400u;
  }
LABEL_13:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  transactionMetrics = self->_transactionMetrics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transactionMetrics, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(transactionMetrics);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTransactionMetrics:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transactionMetrics, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  v14 = (__int16)self->_has;
  if ((v14 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_schedulingTier;
    *(_WORD *)(v6 + 100) |= 0x100u;
    v14 = (__int16)self->_has;
  }
  if ((v14 & 0x800) != 0)
  {
    *(_BYTE *)(v6 + 97) = self->_unused;
    *(_WORD *)(v6 + 100) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  __int16 has;
  __int16 v7;
  NSString *activityUUID;
  __int16 v9;
  NSMutableArray *transactionMetrics;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  has = (__int16)self->_has;
  v7 = *((_WORD *)a3 + 50);
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_timestamp != *((_QWORD *)a3 + 6))
      goto LABEL_68;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  activityUUID = self->_activityUUID;
  if ((unint64_t)activityUUID | *((_QWORD *)a3 + 9))
  {
    v5 = -[NSString isEqual:](activityUUID, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)a3 + 50);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_taskResume != *((_QWORD *)a3 + 5))
      goto LABEL_68;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_didCompleteWithError != *((_QWORD *)a3 + 1))
      goto LABEL_68;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_numberOfRetries != *((_QWORD *)a3 + 4))
      goto LABEL_68;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_numberOfRedirects != *((_QWORD *)a3 + 3))
      goto LABEL_68;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_error != *((_QWORD *)a3 + 2))
      goto LABEL_68;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_underlyingError != *((_QWORD *)a3 + 7))
      goto LABEL_68;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_underlyingErrorDomain != *((_QWORD *)a3 + 8))
      goto LABEL_68;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x200) == 0 || self->_taskType != *((_DWORD *)a3 + 21))
      goto LABEL_68;
  }
  else if ((*((_WORD *)a3 + 50) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x400) == 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x400) != 0)
      goto LABEL_68;
    goto LABEL_58;
  }
  if ((*((_WORD *)a3 + 50) & 0x400) == 0)
    goto LABEL_68;
  if (self->_isBackground)
  {
    if (!*((_BYTE *)a3 + 96))
      goto LABEL_68;
    goto LABEL_58;
  }
  if (*((_BYTE *)a3 + 96))
  {
LABEL_68:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_58:
  transactionMetrics = self->_transactionMetrics;
  if ((unint64_t)transactionMetrics | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSMutableArray isEqual:](transactionMetrics, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x100) == 0 || self->_schedulingTier != *((_DWORD *)a3 + 20))
      goto LABEL_68;
  }
  else if ((*((_WORD *)a3 + 50) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  LOBYTE(v5) = (*((_WORD *)a3 + 50) & 0x800) == 0;
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x800) == 0)
      goto LABEL_68;
    if (self->_unused)
    {
      if (!*((_BYTE *)a3 + 97))
        goto LABEL_68;
    }
    else if (*((_BYTE *)a3 + 97))
    {
      goto LABEL_68;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  unint64_t v19;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v19 = 2654435761u * self->_timestamp;
  else
    v19 = 0;
  v18 = -[NSString hash](self->_activityUUID, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v17 = 2654435761u * self->_taskResume;
    if ((has & 1) != 0)
    {
LABEL_6:
      v15 = 2654435761u * self->_didCompleteWithError;
      if ((has & 8) != 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else
  {
    v17 = 0;
    if ((has & 1) != 0)
      goto LABEL_6;
  }
  v15 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v4 = 2654435761u * self->_numberOfRetries;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v5 = 2654435761u * self->_numberOfRedirects;
    if ((has & 2) != 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_error;
    if ((has & 0x40) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_underlyingError;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v8 = 2654435761 * self->_underlyingErrorDomain;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_12;
LABEL_21:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_20:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_21;
LABEL_12:
  v9 = 2654435761 * self->_taskType;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    v10 = 2654435761 * self->_isBackground;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
LABEL_23:
  v11 = -[NSMutableArray hash](self->_transactionMetrics, "hash", v15);
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v12 = 2654435761 * self->_schedulingTier;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_25;
LABEL_27:
    v13 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_27;
LABEL_25:
  v13 = 2654435761 * self->_unused;
  return v18 ^ v19 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((*((_WORD *)a3 + 50) & 0x20) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)a3 + 9))
    -[AWDCFNetworkTaskMetrics setActivityUUID:](self, "setActivityUUID:");
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x10) != 0)
  {
    self->_taskResume = *((_QWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)a3 + 50);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_8;
      goto LABEL_29;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_didCompleteWithError = *((_QWORD *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_30;
  }
LABEL_29:
  self->_numberOfRetries = *((_QWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_31;
  }
LABEL_30:
  self->_numberOfRedirects = *((_QWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  self->_error = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  self->_underlyingError = *((_QWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  self->_underlyingErrorDomain = *((_QWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_34:
  self->_taskType = *((_DWORD *)a3 + 21);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 50) & 0x400) != 0)
  {
LABEL_14:
    self->_isBackground = *((_BYTE *)a3 + 96);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_15:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 11);
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
        -[AWDCFNetworkTaskMetrics addTransactionMetrics:](self, "addTransactionMetrics:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  v11 = *((_WORD *)a3 + 50);
  if ((v11 & 0x100) != 0)
  {
    self->_schedulingTier = *((_DWORD *)a3 + 20);
    *(_WORD *)&self->_has |= 0x100u;
    v11 = *((_WORD *)a3 + 50);
  }
  if ((v11 & 0x800) != 0)
  {
    self->_unused = *((_BYTE *)a3 + 97);
    *(_WORD *)&self->_has |= 0x800u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unint64_t)taskResume
{
  return self->_taskResume;
}

- (unint64_t)didCompleteWithError
{
  return self->_didCompleteWithError;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (unint64_t)numberOfRedirects
{
  return self->_numberOfRedirects;
}

- (int64_t)error
{
  return self->_error;
}

- (int64_t)underlyingError
{
  return self->_underlyingError;
}

- (int64_t)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (NSMutableArray)transactionMetrics
{
  return self->_transactionMetrics;
}

- (void)setTransactionMetrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)unused
{
  return self->_unused;
}

@end
