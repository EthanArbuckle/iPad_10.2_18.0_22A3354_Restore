@implementation POMMESSchemaPOMMESPegasusRequestEnded

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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)POMMESSchemaPOMMESPegasusRequestEnded;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[POMMESSchemaPOMMESPegasusRequestEnded deleteServerDriven](self, "deleteServerDriven");
  -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[POMMESSchemaPOMMESPegasusRequestEnded deleteClientDriven](self, "deleteClientDriven");
  -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[POMMESSchemaPOMMESPegasusRequestEnded deleteRequestArguments](self, "deleteRequestArguments");
  -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[POMMESSchemaPOMMESPegasusRequestEnded deleteKfedLatency](self, "deleteKfedLatency");

  return v5;
}

- (void)setStatus:(int)a3
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
  -[POMMESSchemaPOMMESPegasusRequestEnded setStatus:](self, "setStatus:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConfidenceScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_confidenceScore = a3;
}

- (BOOL)hasConfidenceScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConfidenceScore
{
  -[POMMESSchemaPOMMESPegasusRequestEnded setConfidenceScore:](self, "setConfidenceScore:", 0.0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setPayloadSizeInKB:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_payloadSizeInKB = a3;
}

- (BOOL)hasPayloadSizeInKB
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPayloadSizeInKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deletePayloadSizeInKB
{
  -[POMMESSchemaPOMMESPegasusRequestEnded setPayloadSizeInKB:](self, "setPayloadSizeInKB:", 0.0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setServerDriven:(id)a3
{
  POMMESSchemaPOMMESPegasusResponseServerDrivenContext *v4;
  POMMESSchemaPOMMESPegasusResponseClientDrivenContext *clientDriven;
  POMMESSchemaPOMMESPegasusResponseServerDrivenContext *serverDriven;

  v4 = (POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)a3;
  clientDriven = self->_clientDriven;
  self->_clientDriven = 0;

  *(_QWORD *)&self->_hasKfedLatency = 4 * (v4 != 0);
  serverDriven = self->_serverDriven;
  self->_serverDriven = v4;

}

- (POMMESSchemaPOMMESPegasusResponseServerDrivenContext)serverDriven
{
  if (*(_QWORD *)&self->_hasKfedLatency == 4)
    return self->_serverDriven;
  else
    return (POMMESSchemaPOMMESPegasusResponseServerDrivenContext *)0;
}

- (void)deleteServerDriven
{
  POMMESSchemaPOMMESPegasusResponseServerDrivenContext *serverDriven;

  if (*(_QWORD *)&self->_hasKfedLatency == 4)
  {
    *(_QWORD *)&self->_hasKfedLatency = 0;
    serverDriven = self->_serverDriven;
    self->_serverDriven = 0;

  }
}

- (void)setClientDriven:(id)a3
{
  POMMESSchemaPOMMESPegasusResponseClientDrivenContext *v4;
  POMMESSchemaPOMMESPegasusResponseServerDrivenContext *serverDriven;
  uint64_t v6;
  POMMESSchemaPOMMESPegasusResponseClientDrivenContext *clientDriven;

  v4 = (POMMESSchemaPOMMESPegasusResponseClientDrivenContext *)a3;
  serverDriven = self->_serverDriven;
  self->_serverDriven = 0;

  v6 = 5;
  if (!v4)
    v6 = 0;
  *(_QWORD *)&self->_hasKfedLatency = v6;
  clientDriven = self->_clientDriven;
  self->_clientDriven = v4;

}

- (POMMESSchemaPOMMESPegasusResponseClientDrivenContext)clientDriven
{
  if (*(_QWORD *)&self->_hasKfedLatency == 5)
    return self->_clientDriven;
  else
    return (POMMESSchemaPOMMESPegasusResponseClientDrivenContext *)0;
}

- (void)deleteClientDriven
{
  POMMESSchemaPOMMESPegasusResponseClientDrivenContext *clientDriven;

  if (*(_QWORD *)&self->_hasKfedLatency == 5)
  {
    *(_QWORD *)&self->_hasKfedLatency = 0;
    clientDriven = self->_clientDriven;
    self->_clientDriven = 0;

  }
}

- (BOOL)hasPegasusDomain
{
  return self->_pegasusDomain != 0;
}

- (void)deletePegasusDomain
{
  -[POMMESSchemaPOMMESPegasusRequestEnded setPegasusDomain:](self, "setPegasusDomain:", 0);
}

- (void)setIsRewrittenUtteranceUsed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isRewrittenUtteranceUsed = a3;
}

- (BOOL)hasIsRewrittenUtteranceUsed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsRewrittenUtteranceUsed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteIsRewrittenUtteranceUsed
{
  -[POMMESSchemaPOMMESPegasusRequestEnded setIsRewrittenUtteranceUsed:](self, "setIsRewrittenUtteranceUsed:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasRequestArguments
{
  return self->_requestArguments != 0;
}

- (void)deleteRequestArguments
{
  -[POMMESSchemaPOMMESPegasusRequestEnded setRequestArguments:](self, "setRequestArguments:", 0);
}

- (BOOL)hasKfedLatency
{
  return self->_kfedLatency != 0;
}

- (void)deleteKfedLatency
{
  -[POMMESSchemaPOMMESPegasusRequestEnded setKfedLatency:](self, "setKfedLatency:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusRequestEndedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
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
  id v15;

  v15 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteDoubleField();
LABEL_5:
  -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESPegasusRequestEnded pegasusDomain](self, "pegasusDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  uint64_t v5;
  $E230000EE0E890308B0A9012095DAC39 has;
  unsigned int v7;
  int status;
  int v9;
  double confidenceScore;
  double v11;
  int v12;
  double payloadSizeInKB;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int isRewrittenUtteranceUsed;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  BOOL v44;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  v5 = *(_QWORD *)&self->_hasKfedLatency;
  if (v5 != objc_msgSend(v4, "whichContextevent"))
    goto LABEL_42;
  has = self->_has;
  v7 = v4[80];
  if ((*(_BYTE *)&has & 1) != (v7 & 1))
    goto LABEL_42;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    status = self->_status;
    if (status != objc_msgSend(v4, "status"))
      goto LABEL_42;
    has = self->_has;
    v7 = v4[80];
  }
  v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      confidenceScore = self->_confidenceScore;
      objc_msgSend(v4, "confidenceScore");
      if (confidenceScore != v11)
        goto LABEL_42;
      has = self->_has;
      v7 = v4[80];
    }
    v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 != ((v7 >> 2) & 1))
      goto LABEL_42;
    if (v12)
    {
      payloadSizeInKB = self->_payloadSizeInKB;
      objc_msgSend(v4, "payloadSizeInKB");
      if (payloadSizeInKB != v14)
        goto LABEL_42;
    }
    -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serverDriven");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 == 0) == (v16 != 0))
      goto LABEL_41;
    -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serverDriven");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
        goto LABEL_42;
    }
    else
    {

    }
    -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientDriven");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 == 0) == (v16 != 0))
      goto LABEL_41;
    -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientDriven");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_42;
    }
    else
    {

    }
    -[POMMESSchemaPOMMESPegasusRequestEnded pegasusDomain](self, "pegasusDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pegasusDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 == 0) == (v16 != 0))
      goto LABEL_41;
    -[POMMESSchemaPOMMESPegasusRequestEnded pegasusDomain](self, "pegasusDomain");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      -[POMMESSchemaPOMMESPegasusRequestEnded pegasusDomain](self, "pegasusDomain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pegasusDomain");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_42;
    }
    else
    {

    }
    v32 = (*(_BYTE *)&self->_has >> 3) & 1;
    if (v32 != ((v4[80] >> 3) & 1))
      goto LABEL_42;
    if (v32)
    {
      isRewrittenUtteranceUsed = self->_isRewrittenUtteranceUsed;
      if (isRewrittenUtteranceUsed != objc_msgSend(v4, "isRewrittenUtteranceUsed"))
        goto LABEL_42;
    }
    -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestArguments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 == 0) == (v16 != 0))
      goto LABEL_41;
    -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)v34;
      -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "requestArguments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_42;
    }
    else
    {

    }
    -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kfedLatency");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 == 0) != (v16 != 0))
    {
      -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
      v39 = objc_claimAutoreleasedReturnValue();
      if (!v39)
      {

LABEL_45:
        v44 = 1;
        goto LABEL_43;
      }
      v40 = (void *)v39;
      -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "kfedLatency");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqual:", v42);

      if ((v43 & 1) != 0)
        goto LABEL_45;
    }
    else
    {
LABEL_41:

    }
  }
LABEL_42:
  v44 = 0;
LABEL_43:

  return v44;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double confidenceScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double payloadSizeInKB;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761 * self->_status;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  confidenceScore = self->_confidenceScore;
  v6 = -confidenceScore;
  if (confidenceScore >= 0.0)
    v6 = self->_confidenceScore;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    payloadSizeInKB = self->_payloadSizeInKB;
    v12 = -payloadSizeInKB;
    if (payloadSizeInKB >= 0.0)
      v12 = self->_payloadSizeInKB;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[POMMESSchemaPOMMESPegasusResponseServerDrivenContext hash](self->_serverDriven, "hash");
  v16 = -[POMMESSchemaPOMMESPegasusResponseClientDrivenContext hash](self->_clientDriven, "hash");
  v17 = -[NSString hash](self->_pegasusDomain, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v18 = 2654435761 * self->_isRewrittenUtteranceUsed;
  else
    v18 = 0;
  v19 = v9 ^ v4 ^ v10 ^ v15 ^ v16 ^ v17;
  v20 = v18 ^ -[POMMESSchemaPOMMESPegasusRequestArguments hash](self->_requestArguments, "hash");
  return v19 ^ v20 ^ -[POMMESSchemaPOMMESPegasusRequestKfedLatency hash](self->_kfedLatency, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char has;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  const __CFString *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_clientDriven)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded clientDriven](self, "clientDriven");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("clientDriven"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("clientDriven"));

    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[POMMESSchemaPOMMESPegasusRequestEnded confidenceScore](self, "confidenceScore");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("confidenceScore"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[POMMESSchemaPOMMESPegasusRequestEnded isRewrittenUtteranceUsed](self, "isRewrittenUtteranceUsed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isRewrittenUtteranceUsed"));

  }
  if (self->_kfedLatency)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded kfedLatency](self, "kfedLatency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("kfedLatency"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("kfedLatency"));

    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[POMMESSchemaPOMMESPegasusRequestEnded payloadSizeInKB](self, "payloadSizeInKB");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("payloadSizeInKB"));

  }
  if (self->_pegasusDomain)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded pegasusDomain](self, "pegasusDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("pegasusDomain"));

  }
  if (self->_requestArguments)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded requestArguments](self, "requestArguments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("requestArguments"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("requestArguments"));

    }
  }
  if (self->_serverDriven)
  {
    -[POMMESSchemaPOMMESPegasusRequestEnded serverDriven](self, "serverDriven");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("serverDriven"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("serverDriven"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v24 = -[POMMESSchemaPOMMESPegasusRequestEnded status](self, "status") - 1;
    if (v24 > 2)
      v25 = CFSTR("POMMESPEGASUSRESPONSESTATUS_UNKNOWN");
    else
      v25 = off_1E5633040[v24];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("status"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[POMMESSchemaPOMMESPegasusRequestEnded dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (POMMESSchemaPOMMESPegasusRequestEnded)initWithJSON:(id)a3
{
  void *v4;
  POMMESSchemaPOMMESPegasusRequestEnded *v5;
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
    self = -[POMMESSchemaPOMMESPegasusRequestEnded initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (POMMESSchemaPOMMESPegasusRequestEnded)initWithDictionary:(id)a3
{
  id v4;
  POMMESSchemaPOMMESPegasusRequestEnded *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  POMMESSchemaPOMMESPegasusResponseServerDrivenContext *v10;
  void *v11;
  POMMESSchemaPOMMESPegasusResponseClientDrivenContext *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  POMMESSchemaPOMMESPegasusRequestArguments *v17;
  void *v18;
  POMMESSchemaPOMMESPegasusRequestKfedLatency *v19;
  POMMESSchemaPOMMESPegasusRequestEnded *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)POMMESSchemaPOMMESPegasusRequestEnded;
  v5 = -[POMMESSchemaPOMMESPegasusRequestEnded init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusRequestEnded setStatus:](v5, "setStatus:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidenceScore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "doubleValue");
      -[POMMESSchemaPOMMESPegasusRequestEnded setConfidenceScore:](v5, "setConfidenceScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("payloadSizeInKB"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[POMMESSchemaPOMMESPegasusRequestEnded setPayloadSizeInKB:](v5, "setPayloadSizeInKB:");
    }
    v23 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serverDriven"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[POMMESSchemaPOMMESPegasusResponseServerDrivenContext initWithDictionary:]([POMMESSchemaPOMMESPegasusResponseServerDrivenContext alloc], "initWithDictionary:", v9);
      -[POMMESSchemaPOMMESPegasusRequestEnded setServerDriven:](v5, "setServerDriven:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientDriven"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[POMMESSchemaPOMMESPegasusResponseClientDrivenContext initWithDictionary:]([POMMESSchemaPOMMESPegasusResponseClientDrivenContext alloc], "initWithDictionary:", v11);
      -[POMMESSchemaPOMMESPegasusRequestEnded setClientDriven:](v5, "setClientDriven:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pegasusDomain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[POMMESSchemaPOMMESPegasusRequestEnded setPegasusDomain:](v5, "setPegasusDomain:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRewrittenUtteranceUsed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[POMMESSchemaPOMMESPegasusRequestEnded setIsRewrittenUtteranceUsed:](v5, "setIsRewrittenUtteranceUsed:", objc_msgSend(v15, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestArguments"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[POMMESSchemaPOMMESPegasusRequestArguments initWithDictionary:]([POMMESSchemaPOMMESPegasusRequestArguments alloc], "initWithDictionary:", v16);
      -[POMMESSchemaPOMMESPegasusRequestEnded setRequestArguments:](v5, "setRequestArguments:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kfedLatency"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[POMMESSchemaPOMMESPegasusRequestKfedLatency initWithDictionary:]([POMMESSchemaPOMMESPegasusRequestKfedLatency alloc], "initWithDictionary:", v18);
      -[POMMESSchemaPOMMESPegasusRequestEnded setKfedLatency:](v5, "setKfedLatency:", v19);

    }
    v20 = v5;

  }
  return v5;
}

- (unint64_t)whichContextevent
{
  return *(_QWORD *)&self->_hasKfedLatency;
}

- (int)status
{
  return self->_status;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (double)payloadSizeInKB
{
  return self->_payloadSizeInKB;
}

- (NSString)pegasusDomain
{
  return self->_pegasusDomain;
}

- (void)setPegasusDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isRewrittenUtteranceUsed
{
  return self->_isRewrittenUtteranceUsed;
}

- (POMMESSchemaPOMMESPegasusRequestArguments)requestArguments
{
  return self->_requestArguments;
}

- (void)setRequestArguments:(id)a3
{
  objc_storeStrong((id *)&self->_requestArguments, a3);
}

- (POMMESSchemaPOMMESPegasusRequestKfedLatency)kfedLatency
{
  return self->_kfedLatency;
}

- (void)setKfedLatency:(id)a3
{
  objc_storeStrong((id *)&self->_kfedLatency, a3);
}

- (BOOL)hasServerDriven
{
  return *((_BYTE *)&self->_has + 1);
}

- (void)setHasServerDriven:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (BOOL)hasClientDriven
{
  return *((_BYTE *)&self->_has + 2);
}

- (void)setHasClientDriven:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPegasusDomain:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasRequestArguments:(BOOL)a3
{
  self->_hasServerDriven = a3;
}

- (void)setHasKfedLatency:(BOOL)a3
{
  self->_hasClientDriven = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kfedLatency, 0);
  objc_storeStrong((id *)&self->_requestArguments, 0);
  objc_storeStrong((id *)&self->_pegasusDomain, 0);
  objc_storeStrong((id *)&self->_clientDriven, 0);
  objc_storeStrong((id *)&self->_serverDriven, 0);
}

@end
