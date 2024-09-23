@implementation PNRODSchemaPNRODScheduleDebugSummary

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PNRODSchemaPNRODScheduleDebugSummary;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[PNRODSchemaPNRODScheduleDebugSummary deleteScheduleId](self, "deleteScheduleId");
  return v5;
}

- (BOOL)hasScheduleId
{
  return self->_scheduleId != 0;
}

- (void)deleteScheduleId
{
  -[PNRODSchemaPNRODScheduleDebugSummary setScheduleId:](self, "setScheduleId:", 0);
}

- (void)setNumRequestsRead:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numRequestsRead = a3;
}

- (BOOL)hasNumRequestsRead
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNumRequestsRead:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)deleteNumRequestsRead
{
  -[PNRODSchemaPNRODScheduleDebugSummary setNumRequestsRead:](self, "setNumRequestsRead:", 0);
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setNumRequestsWrite:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numRequestsWrite = a3;
}

- (BOOL)hasNumRequestsWrite
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNumRequestsWrite:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)deleteNumRequestsWrite
{
  -[PNRODSchemaPNRODScheduleDebugSummary setNumRequestsWrite:](self, "setNumRequestsWrite:", 0);
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setProcessingWaitTimeInSecond:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_processingWaitTimeInSecond = a3;
}

- (BOOL)hasProcessingWaitTimeInSecond
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasProcessingWaitTimeInSecond:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)deleteProcessingWaitTimeInSecond
{
  -[PNRODSchemaPNRODScheduleDebugSummary setProcessingWaitTimeInSecond:](self, "setProcessingWaitTimeInSecond:", 0.0);
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setProcessingTimeInSecond:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_processingTimeInSecond = a3;
}

- (BOOL)hasProcessingTimeInSecond
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasProcessingTimeInSecond:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)deleteProcessingTimeInSecond
{
  -[PNRODSchemaPNRODScheduleDebugSummary setProcessingTimeInSecond:](self, "setProcessingTimeInSecond:", 0.0);
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setEventTimestampInMsSince1970:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_eventTimestampInMsSince1970 = a3;
}

- (BOOL)hasEventTimestampInMsSince1970
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasEventTimestampInMsSince1970:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)deleteEventTimestampInMsSince1970
{
  -[PNRODSchemaPNRODScheduleDebugSummary setEventTimestampInMsSince1970:](self, "setEventTimestampInMsSince1970:", 0);
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setDelayFromLastBiomeBookmarkInSecond:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_delayFromLastBiomeBookmarkInSecond = a3;
}

- (BOOL)hasDelayFromLastBiomeBookmarkInSecond
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasDelayFromLastBiomeBookmarkInSecond:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)deleteDelayFromLastBiomeBookmarkInSecond
{
  -[PNRODSchemaPNRODScheduleDebugSummary setDelayFromLastBiomeBookmarkInSecond:](self, "setDelayFromLastBiomeBookmarkInSecond:", 0.0);
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setFailureReasonIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_failureReasonIndex = a3;
}

- (BOOL)hasFailureReasonIndex
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasFailureReasonIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)deleteFailureReasonIndex
{
  -[PNRODSchemaPNRODScheduleDebugSummary setFailureReasonIndex:](self, "setFailureReasonIndex:", 0);
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setDataSourceIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_dataSourceIndex = a3;
}

- (BOOL)hasDataSourceIndex
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasDataSourceIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)deleteDataSourceIndex
{
  -[PNRODSchemaPNRODScheduleDebugSummary setDataSourceIndex:](self, "setDataSourceIndex:", 0);
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setWorkerIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_workerIndex = a3;
}

- (BOOL)hasWorkerIndex
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasWorkerIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)deleteWorkerIndex
{
  -[PNRODSchemaPNRODScheduleDebugSummary setWorkerIndex:](self, "setWorkerIndex:", 0);
  *(_WORD *)&self->_has &= ~0x100u;
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODScheduleDebugSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  __int16 has;
  void *v7;
  id v8;

  v8 = a3;
  -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
  }
  v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v7 = v8;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
LABEL_21:
    PBDataWriterWriteInt64Field();
    v7 = v8;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  v7 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_21;
LABEL_12:
  if ((has & 0x100) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt64Field();
    v7 = v8;
  }
LABEL_14:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  $C70DB8B6050B4D66C5B627C76CB662EB has;
  unsigned int v14;
  unsigned int numRequestsRead;
  int v16;
  unsigned int numRequestsWrite;
  int v18;
  double processingWaitTimeInSecond;
  double v20;
  int v21;
  double processingTimeInSecond;
  double v23;
  int v24;
  unint64_t eventTimestampInMsSince1970;
  int v26;
  double delayFromLastBiomeBookmarkInSecond;
  double v28;
  int v29;
  int64_t failureReasonIndex;
  int v31;
  int64_t dataSourceIndex;
  int v33;
  int64_t workerIndex;
  BOOL v35;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_44;
  }
  -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_44;
  }
  else
  {

  }
  has = self->_has;
  v14 = v4[40];
  if ((*(_BYTE *)&has & 1) != (v14 & 1))
  {
LABEL_44:
    v35 = 0;
    goto LABEL_45;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numRequestsRead = self->_numRequestsRead;
    if (numRequestsRead != objc_msgSend(v4, "numRequestsRead"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1))
    goto LABEL_44;
  if (v16)
  {
    numRequestsWrite = self->_numRequestsWrite;
    if (numRequestsWrite != objc_msgSend(v4, "numRequestsWrite"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1))
    goto LABEL_44;
  if (v18)
  {
    processingWaitTimeInSecond = self->_processingWaitTimeInSecond;
    objc_msgSend(v4, "processingWaitTimeInSecond");
    if (processingWaitTimeInSecond != v20)
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v14 >> 3) & 1))
    goto LABEL_44;
  if (v21)
  {
    processingTimeInSecond = self->_processingTimeInSecond;
    objc_msgSend(v4, "processingTimeInSecond");
    if (processingTimeInSecond != v23)
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v24 = (*(unsigned int *)&has >> 4) & 1;
  if (v24 != ((v14 >> 4) & 1))
    goto LABEL_44;
  if (v24)
  {
    eventTimestampInMsSince1970 = self->_eventTimestampInMsSince1970;
    if (eventTimestampInMsSince1970 != objc_msgSend(v4, "eventTimestampInMsSince1970"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v26 = (*(unsigned int *)&has >> 5) & 1;
  if (v26 != ((v14 >> 5) & 1))
    goto LABEL_44;
  if (v26)
  {
    delayFromLastBiomeBookmarkInSecond = self->_delayFromLastBiomeBookmarkInSecond;
    objc_msgSend(v4, "delayFromLastBiomeBookmarkInSecond");
    if (delayFromLastBiomeBookmarkInSecond != v28)
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v29 = (*(unsigned int *)&has >> 6) & 1;
  if (v29 != ((v14 >> 6) & 1))
    goto LABEL_44;
  if (v29)
  {
    failureReasonIndex = self->_failureReasonIndex;
    if (failureReasonIndex != objc_msgSend(v4, "failureReasonIndex"))
      goto LABEL_44;
    has = self->_has;
    v14 = v4[40];
  }
  v31 = (*(unsigned int *)&has >> 7) & 1;
  if (v31 != ((v14 >> 7) & 1))
    goto LABEL_44;
  if (v31)
  {
    dataSourceIndex = self->_dataSourceIndex;
    if (dataSourceIndex == objc_msgSend(v4, "dataSourceIndex"))
    {
      has = self->_has;
      v14 = v4[40];
      goto LABEL_40;
    }
    goto LABEL_44;
  }
LABEL_40:
  v33 = (*(unsigned int *)&has >> 8) & 1;
  if (v33 != ((v14 >> 8) & 1))
    goto LABEL_44;
  if (v33)
  {
    workerIndex = self->_workerIndex;
    if (workerIndex != objc_msgSend(v4, "workerIndex"))
      goto LABEL_44;
  }
  v35 = 1;
LABEL_45:

  return v35;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  double processingWaitTimeInSecond;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double processingTimeInSecond;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  double delayFromLastBiomeBookmarkInSecond;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = -[SISchemaUUID hash](self->_scheduleId, "hash");
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v5 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = 0;
    if ((has & 4) != 0)
      goto LABEL_4;
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v5 = 2654435761 * self->_numRequestsRead;
  if ((has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v6 = 2654435761 * self->_numRequestsWrite;
  if ((has & 4) == 0)
    goto LABEL_10;
LABEL_4:
  processingWaitTimeInSecond = self->_processingWaitTimeInSecond;
  v8 = -processingWaitTimeInSecond;
  if (processingWaitTimeInSecond >= 0.0)
    v8 = self->_processingWaitTimeInSecond;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    processingTimeInSecond = self->_processingTimeInSecond;
    v14 = -processingTimeInSecond;
    if (processingTimeInSecond >= 0.0)
      v14 = self->_processingTimeInSecond;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v17 = 2654435761u * self->_eventTimestampInMsSince1970;
    if ((has & 0x20) != 0)
      goto LABEL_23;
LABEL_28:
    v22 = 0;
    goto LABEL_31;
  }
  v17 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_28;
LABEL_23:
  delayFromLastBiomeBookmarkInSecond = self->_delayFromLastBiomeBookmarkInSecond;
  v19 = -delayFromLastBiomeBookmarkInSecond;
  if (delayFromLastBiomeBookmarkInSecond >= 0.0)
    v19 = self->_delayFromLastBiomeBookmarkInSecond;
  v20 = floor(v19 + 0.5);
  v21 = (v19 - v20) * 1.84467441e19;
  v22 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0)
      v22 += (unint64_t)v21;
  }
  else
  {
    v22 -= (unint64_t)fabs(v21);
  }
LABEL_31:
  if ((has & 0x40) == 0)
  {
    v23 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_33;
LABEL_36:
    v24 = 0;
    if ((has & 0x100) != 0)
      goto LABEL_34;
LABEL_37:
    v25 = 0;
    return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25;
  }
  v23 = 2654435761 * self->_failureReasonIndex;
  if ((has & 0x80) == 0)
    goto LABEL_36;
LABEL_33:
  v24 = 2654435761 * self->_dataSourceIndex;
  if ((has & 0x100) == 0)
    goto LABEL_37;
LABEL_34:
  v25 = 2654435761 * self->_workerIndex;
  return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ v17 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary dataSourceIndex](self, "dataSourceIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("dataSourceIndex"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PNRODSchemaPNRODScheduleDebugSummary delayFromLastBiomeBookmarkInSecond](self, "delayFromLastBiomeBookmarkInSecond");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("delayFromLastBiomeBookmarkInSecond"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary eventTimestampInMsSince1970](self, "eventTimestampInMsSince1970"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("eventTimestampInMsSince1970"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary failureReasonIndex](self, "failureReasonIndex"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("failureReasonIndex"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODScheduleDebugSummary numRequestsRead](self, "numRequestsRead"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("numRequestsRead"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PNRODSchemaPNRODScheduleDebugSummary numRequestsWrite](self, "numRequestsWrite"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("numRequestsWrite"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PNRODSchemaPNRODScheduleDebugSummary processingTimeInSecond](self, "processingTimeInSecond");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("processingTimeInSecond"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_9:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PNRODSchemaPNRODScheduleDebugSummary processingWaitTimeInSecond](self, "processingWaitTimeInSecond");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("processingWaitTimeInSecond"));

  }
LABEL_10:
  if (self->_scheduleId)
  {
    -[PNRODSchemaPNRODScheduleDebugSummary scheduleId](self, "scheduleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("scheduleId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("scheduleId"));

    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODScheduleDebugSummary workerIndex](self, "workerIndex"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("workerIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODScheduleDebugSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRODSchemaPNRODScheduleDebugSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODScheduleDebugSummary *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[PNRODSchemaPNRODScheduleDebugSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODScheduleDebugSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODScheduleDebugSummary *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PNRODSchemaPNRODScheduleDebugSummary *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PNRODSchemaPNRODScheduleDebugSummary;
  v5 = -[PNRODSchemaPNRODScheduleDebugSummary init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scheduleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODScheduleDebugSummary setScheduleId:](v5, "setScheduleId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numRequestsRead"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODScheduleDebugSummary setNumRequestsRead:](v5, "setNumRequestsRead:", objc_msgSend(v8, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numRequestsWrite"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODScheduleDebugSummary setNumRequestsWrite:](v5, "setNumRequestsWrite:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processingWaitTimeInSecond"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "doubleValue");
      -[PNRODSchemaPNRODScheduleDebugSummary setProcessingWaitTimeInSecond:](v5, "setProcessingWaitTimeInSecond:");
    }
    v20 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processingTimeInSecond"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      -[PNRODSchemaPNRODScheduleDebugSummary setProcessingTimeInSecond:](v5, "setProcessingTimeInSecond:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventTimestampInMsSince1970"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODScheduleDebugSummary setEventTimestampInMsSince1970:](v5, "setEventTimestampInMsSince1970:", objc_msgSend(v12, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delayFromLastBiomeBookmarkInSecond"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "doubleValue");
      -[PNRODSchemaPNRODScheduleDebugSummary setDelayFromLastBiomeBookmarkInSecond:](v5, "setDelayFromLastBiomeBookmarkInSecond:");
    }
    v21 = v9;
    v22 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureReasonIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODScheduleDebugSummary setFailureReasonIndex:](v5, "setFailureReasonIndex:", objc_msgSend(v14, "longLongValue"));
    v15 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataSourceIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODScheduleDebugSummary setDataSourceIndex:](v5, "setDataSourceIndex:", objc_msgSend(v16, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("workerIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODScheduleDebugSummary setWorkerIndex:](v5, "setWorkerIndex:", objc_msgSend(v17, "longLongValue"));
    v18 = v5;

  }
  return v5;
}

- (SISchemaUUID)scheduleId
{
  return self->_scheduleId;
}

- (void)setScheduleId:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleId, a3);
}

- (unsigned)numRequestsRead
{
  return self->_numRequestsRead;
}

- (unsigned)numRequestsWrite
{
  return self->_numRequestsWrite;
}

- (double)processingWaitTimeInSecond
{
  return self->_processingWaitTimeInSecond;
}

- (double)processingTimeInSecond
{
  return self->_processingTimeInSecond;
}

- (unint64_t)eventTimestampInMsSince1970
{
  return self->_eventTimestampInMsSince1970;
}

- (double)delayFromLastBiomeBookmarkInSecond
{
  return self->_delayFromLastBiomeBookmarkInSecond;
}

- (int64_t)failureReasonIndex
{
  return self->_failureReasonIndex;
}

- (int64_t)dataSourceIndex
{
  return self->_dataSourceIndex;
}

- (int64_t)workerIndex
{
  return self->_workerIndex;
}

- (void)setHasScheduleId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleId, 0);
}

@end
