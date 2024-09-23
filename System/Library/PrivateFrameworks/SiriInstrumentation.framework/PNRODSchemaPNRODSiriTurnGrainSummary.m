@implementation PNRODSchemaPNRODSiriTurnGrainSummary

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
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PNRODSchemaPNRODSiriTurnGrainSummary;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v28, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteTurnid](self, "deleteTurnid");
  -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteSrt](self, "deleteSrt");
  -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteLaunch](self, "deleteLaunch");
  -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteEpd](self, "deleteEpd");
  -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteUufr](self, "deleteUufr");
  -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteTtfw](self, "deleteTtfw");
  -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[PNRODSchemaPNRODSiriTurnGrainSummary deleteFailureInfo](self, "deleteFailureInfo");

  return v5;
}

- (BOOL)hasTurnid
{
  return self->_turnid != 0;
}

- (void)deleteTurnid
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setTurnid:](self, "setTurnid:", 0);
}

- (void)setStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteStatus
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setHasAssistantPerformanceData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasAssistantPerformanceData = a3;
}

- (BOOL)hasHasAssistantPerformanceData
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasHasAssistantPerformanceData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteHasAssistantPerformanceData
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setHasAssistantPerformanceData:](self, "setHasAssistantPerformanceData:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setHasDictationPerformanceData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasDictationPerformanceData = a3;
}

- (BOOL)hasHasDictationPerformanceData
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHasDictationPerformanceData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteHasDictationPerformanceData
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setHasDictationPerformanceData:](self, "setHasDictationPerformanceData:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setHasReliabilityData:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_hasReliabilityData = a3;
}

- (BOOL)hasHasReliabilityData
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasHasReliabilityData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteHasReliabilityData
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setHasReliabilityData:](self, "setHasReliabilityData:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasSrt
{
  return self->_srt != 0;
}

- (void)deleteSrt
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setSrt:](self, "setSrt:", 0);
}

- (BOOL)hasLaunch
{
  return self->_launch != 0;
}

- (void)deleteLaunch
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setLaunch:](self, "setLaunch:", 0);
}

- (BOOL)hasEpd
{
  return self->_epd != 0;
}

- (void)deleteEpd
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setEpd:](self, "setEpd:", 0);
}

- (BOOL)hasUufr
{
  return self->_uufr != 0;
}

- (void)deleteUufr
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setUufr:](self, "setUufr:", 0);
}

- (BOOL)hasTtfw
{
  return self->_ttfw != 0;
}

- (void)deleteTtfw
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setTtfw:](self, "setTtfw:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRODSchemaPNRODSiriTurnGrainSummary setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODSiriTurnGrainSummaryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  char has;
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
  id v20;

  v20 = a3;
  -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:
  -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v20;
  if (v17)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v18 = v20;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $1DDDFEDC4C1F10C0721AED53D45981CD has;
  unsigned int v13;
  int64_t status;
  int v15;
  int hasAssistantPerformanceData;
  int v17;
  int hasDictationPerformanceData;
  int v19;
  int hasReliabilityData;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  BOOL v51;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "turnid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_52;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[80];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_52;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_52;
    has = self->_has;
    v13 = v4[80];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_52;
  if (v15)
  {
    hasAssistantPerformanceData = self->_hasAssistantPerformanceData;
    if (hasAssistantPerformanceData != objc_msgSend(v4, "hasAssistantPerformanceData"))
      goto LABEL_52;
    has = self->_has;
    v13 = v4[80];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_52;
  if (v17)
  {
    hasDictationPerformanceData = self->_hasDictationPerformanceData;
    if (hasDictationPerformanceData != objc_msgSend(v4, "hasDictationPerformanceData"))
      goto LABEL_52;
    has = self->_has;
    v13 = v4[80];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_52;
  if (v19)
  {
    hasReliabilityData = self->_hasReliabilityData;
    if (hasReliabilityData != objc_msgSend(v4, "hasReliabilityData"))
      goto LABEL_52;
  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "srt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "srt");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_52;
  }
  else
  {

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launch");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_52;
  }
  else
  {

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "epd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "epd");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_52;
  }
  else
  {

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uufr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uufr");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_52;
  }
  else
  {

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ttfw");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_51;
  -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ttfw");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_52;
  }
  else
  {

  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
  v46 = objc_claimAutoreleasedReturnValue();
  if (!v46)
  {

LABEL_55:
    v51 = 1;
    goto LABEL_53;
  }
  v47 = (void *)v46;
  -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v48, "isEqual:", v49);

  if ((v50 & 1) != 0)
    goto LABEL_55;
LABEL_52:
  v51 = 0;
LABEL_53:

  return v51;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[SISchemaUUID hash](self->_turnid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_status;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_hasAssistantPerformanceData;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_hasDictationPerformanceData;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_hasReliabilityData;
LABEL_10:
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_srt, "hash");
  v9 = -[PNRODSchemaPNRODMetricDuration hash](self->_launch, "hash");
  v10 = v9 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_epd, "hash");
  v11 = v8 ^ v10 ^ -[PNRODSchemaPNRODMetricDuration hash](self->_uufr, "hash");
  v12 = -[PNRODSchemaPNRODMetricDuration hash](self->_ttfw, "hash");
  return v11 ^ v12 ^ -[PNRODSchemaPNRODFailureInfo hash](self->_failureInfo, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char has;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_epd)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary epd](self, "epd");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("epd"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("epd"));

    }
  }
  if (self->_failureInfo)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary failureInfo](self, "failureInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failureInfo"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODSiriTurnGrainSummary hasAssistantPerformanceData](self, "hasAssistantPerformanceData"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hasAssistantPerformanceData"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODSiriTurnGrainSummary hasDictationPerformanceData](self, "hasDictationPerformanceData"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hasDictationPerformanceData"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PNRODSchemaPNRODSiriTurnGrainSummary hasReliabilityData](self, "hasReliabilityData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hasReliabilityData"));

  }
LABEL_15:
  if (self->_launch)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary launch](self, "launch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("launch"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("launch"));

    }
  }
  if (self->_srt)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary srt](self, "srt");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("srt"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("srt"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PNRODSchemaPNRODSiriTurnGrainSummary status](self, "status"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("status"));

  }
  if (self->_ttfw)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary ttfw](self, "ttfw");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("ttfw"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ttfw"));

    }
  }
  if (self->_turnid)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary turnid](self, "turnid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("turnid"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("turnid"));

    }
  }
  if (self->_uufr)
  {
    -[PNRODSchemaPNRODSiriTurnGrainSummary uufr](self, "uufr");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("uufr"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("uufr"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRODSchemaPNRODSiriTurnGrainSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRODSchemaPNRODSiriTurnGrainSummary)initWithJSON:(id)a3
{
  void *v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *v5;
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
    self = -[PNRODSchemaPNRODSiriTurnGrainSummary initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRODSchemaPNRODSiriTurnGrainSummary)initWithDictionary:(id)a3
{
  id v4;
  PNRODSchemaPNRODSiriTurnGrainSummary *v5;
  uint64_t v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PNRODSchemaPNRODMetricDuration *v13;
  void *v14;
  PNRODSchemaPNRODMetricDuration *v15;
  void *v16;
  PNRODSchemaPNRODMetricDuration *v17;
  void *v18;
  PNRODSchemaPNRODMetricDuration *v19;
  void *v20;
  PNRODSchemaPNRODMetricDuration *v21;
  void *v22;
  PNRODSchemaPNRODFailureInfo *v23;
  PNRODSchemaPNRODSiriTurnGrainSummary *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PNRODSchemaPNRODSiriTurnGrainSummary;
  v5 = -[PNRODSchemaPNRODSiriTurnGrainSummary init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnid"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setTurnid:](v5, "setTurnid:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODSiriTurnGrainSummary setStatus:](v5, "setStatus:", objc_msgSend(v8, "longLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasAssistantPerformanceData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODSiriTurnGrainSummary setHasAssistantPerformanceData:](v5, "setHasAssistantPerformanceData:", objc_msgSend(v9, "BOOLValue"));
    v27 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasDictationPerformanceData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODSiriTurnGrainSummary setHasDictationPerformanceData:](v5, "setHasDictationPerformanceData:", objc_msgSend(v10, "BOOLValue"));
    v28 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasReliabilityData"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRODSchemaPNRODSiriTurnGrainSummary setHasReliabilityData:](v5, "setHasReliabilityData:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("srt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v12);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setSrt:](v5, "setSrt:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launch"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v14);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setLaunch:](v5, "setLaunch:", v15);

    }
    v29 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("epd"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v16);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setEpd:](v5, "setEpd:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uufr"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v18);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setUufr:](v5, "setUufr:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ttfw"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PNRODSchemaPNRODMetricDuration initWithDictionary:]([PNRODSchemaPNRODMetricDuration alloc], "initWithDictionary:", v20);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setTtfw:](v5, "setTtfw:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PNRODSchemaPNRODFailureInfo initWithDictionary:]([PNRODSchemaPNRODFailureInfo alloc], "initWithDictionary:", v22);
      -[PNRODSchemaPNRODSiriTurnGrainSummary setFailureInfo:](v5, "setFailureInfo:", v23);

    }
    v24 = v5;

  }
  return v5;
}

- (SISchemaUUID)turnid
{
  return self->_turnid;
}

- (void)setTurnid:(id)a3
{
  objc_storeStrong((id *)&self->_turnid, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)hasAssistantPerformanceData
{
  return self->_hasAssistantPerformanceData;
}

- (BOOL)hasDictationPerformanceData
{
  return self->_hasDictationPerformanceData;
}

- (BOOL)hasReliabilityData
{
  return self->_hasReliabilityData;
}

- (PNRODSchemaPNRODMetricDuration)srt
{
  return self->_srt;
}

- (void)setSrt:(id)a3
{
  objc_storeStrong((id *)&self->_srt, a3);
}

- (PNRODSchemaPNRODMetricDuration)launch
{
  return self->_launch;
}

- (void)setLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_launch, a3);
}

- (PNRODSchemaPNRODMetricDuration)epd
{
  return self->_epd;
}

- (void)setEpd:(id)a3
{
  objc_storeStrong((id *)&self->_epd, a3);
}

- (PNRODSchemaPNRODMetricDuration)uufr
{
  return self->_uufr;
}

- (void)setUufr:(id)a3
{
  objc_storeStrong((id *)&self->_uufr, a3);
}

- (PNRODSchemaPNRODMetricDuration)ttfw
{
  return self->_ttfw;
}

- (void)setTtfw:(id)a3
{
  objc_storeStrong((id *)&self->_ttfw, a3);
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasTurnid:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasSrt:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasLaunch:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasEpd:(BOOL)a3
{
  self->_hasTurnid = a3;
}

- (void)setHasUufr:(BOOL)a3
{
  self->_hasSrt = a3;
}

- (void)setHasTtfw:(BOOL)a3
{
  self->_hasLaunch = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasEpd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_ttfw, 0);
  objc_storeStrong((id *)&self->_uufr, 0);
  objc_storeStrong((id *)&self->_epd, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_srt, 0);
  objc_storeStrong((id *)&self->_turnid, 0);
}

@end
