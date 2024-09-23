@implementation NETSchemaNETSessionConnectionFailed

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
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETSchemaNETSessionConnectionFailed;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NETSchemaNETSessionConnectionFailed error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NETSchemaNETSessionConnectionFailed deleteError](self, "deleteError");
  -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NETSchemaNETSessionConnectionFailed deleteUnderlyingError](self, "deleteUnderlyingError");

  return v5;
}

- (void)setConnectionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_connectionType = a3;
}

- (BOOL)hasConnectionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConnectionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteConnectionType
{
  -[NETSchemaNETSessionConnectionFailed setConnectionType:](self, "setConnectionType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setConnectionMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectionMode = a3;
}

- (BOOL)hasConnectionMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasConnectionMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteConnectionMode
{
  -[NETSchemaNETSessionConnectionFailed setConnectionMode:](self, "setConnectionMode:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setSessionType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionType = a3;
}

- (BOOL)hasSessionType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSessionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteSessionType
{
  -[NETSchemaNETSessionConnectionFailed setSessionType:](self, "setSessionType:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNetworkSessionState:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_networkSessionState = a3;
}

- (BOOL)hasNetworkSessionState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNetworkSessionState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNetworkSessionState
{
  -[NETSchemaNETSessionConnectionFailed setNetworkSessionState:](self, "setNetworkSessionState:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setIsWwanPreferred:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isWwanPreferred = a3;
}

- (BOOL)hasIsWwanPreferred
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasIsWwanPreferred:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteIsWwanPreferred
{
  -[NETSchemaNETSessionConnectionFailed setIsWwanPreferred:](self, "setIsWwanPreferred:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setIsDormant:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isDormant = a3;
}

- (BOOL)hasIsDormant
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasIsDormant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteIsDormant
{
  -[NETSchemaNETSessionConnectionFailed setIsDormant:](self, "setIsDormant:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setSendBufferSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_sendBufferSize = a3;
}

- (BOOL)hasSendBufferSize
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasSendBufferSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteSendBufferSize
{
  -[NETSchemaNETSessionConnectionFailed setSendBufferSize:](self, "setSendBufferSize:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)hasPolicyId
{
  return self->_policyId != 0;
}

- (void)deletePolicyId
{
  -[NETSchemaNETSessionConnectionFailed setPolicyId:](self, "setPolicyId:", 0);
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)deleteError
{
  -[NETSchemaNETSessionConnectionFailed setError:](self, "setError:", 0);
}

- (BOOL)hasUnderlyingError
{
  return self->_underlyingError != 0;
}

- (void)deleteUnderlyingError
{
  -[NETSchemaNETSessionConnectionFailed setUnderlyingError:](self, "setUnderlyingError:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETSessionConnectionFailedReadFrom(self, (uint64_t)a3);
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
  id v11;

  v11 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint64Field();
LABEL_9:
  -[NETSchemaNETSessionConnectionFailed policyId](self, "policyId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[NETSchemaNETSessionConnectionFailed error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NETSchemaNETSessionConnectionFailed error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $655415CA7B26D733E92EE4F5528365C3 has;
  unsigned int v6;
  int connectionType;
  int v8;
  int connectionMode;
  int v10;
  int sessionType;
  int v12;
  int networkSessionState;
  int v14;
  int isWwanPreferred;
  int v16;
  int isDormant;
  int v18;
  unint64_t sendBufferSize;
  void *v20;
  void *v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  has = self->_has;
  v6 = v4[64];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_44;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    connectionType = self->_connectionType;
    if (connectionType != objc_msgSend(v4, "connectionType"))
      goto LABEL_44;
    has = self->_has;
    v6 = v4[64];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      connectionMode = self->_connectionMode;
      if (connectionMode != objc_msgSend(v4, "connectionMode"))
        goto LABEL_44;
      has = self->_has;
      v6 = v4[64];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        sessionType = self->_sessionType;
        if (sessionType != objc_msgSend(v4, "sessionType"))
          goto LABEL_44;
        has = self->_has;
        v6 = v4[64];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          networkSessionState = self->_networkSessionState;
          if (networkSessionState != objc_msgSend(v4, "networkSessionState"))
            goto LABEL_44;
          has = self->_has;
          v6 = v4[64];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            isWwanPreferred = self->_isWwanPreferred;
            if (isWwanPreferred != objc_msgSend(v4, "isWwanPreferred"))
              goto LABEL_44;
            has = self->_has;
            v6 = v4[64];
          }
          v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              isDormant = self->_isDormant;
              if (isDormant != objc_msgSend(v4, "isDormant"))
                goto LABEL_44;
              has = self->_has;
              v6 = v4[64];
            }
            v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 != ((v6 >> 6) & 1))
              goto LABEL_44;
            if (v18)
            {
              sendBufferSize = self->_sendBufferSize;
              if (sendBufferSize != objc_msgSend(v4, "sendBufferSize"))
                goto LABEL_44;
            }
            -[NETSchemaNETSessionConnectionFailed policyId](self, "policyId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "policyId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_43;
            -[NETSchemaNETSessionConnectionFailed policyId](self, "policyId");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              -[NETSchemaNETSessionConnectionFailed policyId](self, "policyId");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "policyId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v24, "isEqual:", v25);

              if (!v26)
                goto LABEL_44;
            }
            else
            {

            }
            -[NETSchemaNETSessionConnectionFailed error](self, "error");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "error");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_43;
            -[NETSchemaNETSessionConnectionFailed error](self, "error");
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = (void *)v27;
              -[NETSchemaNETSessionConnectionFailed error](self, "error");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "error");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isEqual:", v30);

              if (!v31)
                goto LABEL_44;
            }
            else
            {

            }
            -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "underlyingError");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) != (v21 != 0))
            {
              -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
              v32 = objc_claimAutoreleasedReturnValue();
              if (!v32)
              {

LABEL_47:
                v37 = 1;
                goto LABEL_45;
              }
              v33 = (void *)v32;
              -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "underlyingError");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v34, "isEqual:", v35);

              if ((v36 & 1) != 0)
                goto LABEL_47;
            }
            else
            {
LABEL_43:

            }
          }
        }
      }
    }
  }
LABEL_44:
  v37 = 0;
LABEL_45:

  return v37;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_connectionType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_connectionMode;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_sessionType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_networkSessionState;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_isWwanPreferred;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_isDormant;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v9 = 2654435761u * self->_sendBufferSize;
LABEL_16:
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_policyId, "hash");
  v11 = -[NETSchemaNETError hash](self->_error, "hash");
  return v10 ^ v11 ^ -[NETSchemaNETError hash](self->_underlyingError, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  unsigned int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = -[NETSchemaNETSessionConnectionFailed connectionMode](self, "connectionMode");
    v6 = CFSTR("NETCONNECTIONMODE_UNKNOWN");
    if (v5 == 1)
      v6 = CFSTR("NETCONNECTIONMODE_ASSISTANT");
    if (v5 == 2)
      v7 = CFSTR("NETCONNECTIONMODE_ASSISTANT_AND_DICTATION");
    else
      v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("connectionMode"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = -[NETSchemaNETSessionConnectionFailed connectionType](self, "connectionType") - 1;
    if (v8 > 0x16)
      v9 = CFSTR("NETCONNECTIONTYPE_UNKNOWN");
    else
      v9 = off_1E5631820[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("connectionType"));
  }
  if (self->_error)
  {
    -[NETSchemaNETSessionConnectionFailed error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("error"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("error"));

    }
  }
  v13 = (char)self->_has;
  if ((v13 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETSessionConnectionFailed isDormant](self, "isDormant"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("isDormant"));

    v13 = (char)self->_has;
    if ((v13 & 0x10) == 0)
    {
LABEL_20:
      if ((v13 & 8) == 0)
        goto LABEL_28;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NETSchemaNETSessionConnectionFailed isWwanPreferred](self, "isWwanPreferred"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("isWwanPreferred"));

  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_28;
LABEL_24:
  v16 = -[NETSchemaNETSessionConnectionFailed networkSessionState](self, "networkSessionState") - 1;
  if (v16 > 0xB)
    v17 = CFSTR("NETSESSIONSTATE_UNKNOWN");
  else
    v17 = off_1E56318D8[v16];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("networkSessionState"));
LABEL_28:
  if (self->_policyId)
  {
    -[NETSchemaNETSessionConnectionFailed policyId](self, "policyId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("policyId"));

  }
  v20 = (char)self->_has;
  if ((v20 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionFailed sendBufferSize](self, "sendBufferSize"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("sendBufferSize"));

    v20 = (char)self->_has;
  }
  if ((v20 & 4) != 0)
  {
    v22 = -[NETSchemaNETSessionConnectionFailed sessionType](self, "sessionType") - 1;
    if (v22 > 3)
      v23 = CFSTR("NETSESSIONTYPE_UNKNOWN");
    else
      v23 = off_1E5631938[v22];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("sessionType"));
  }
  if (self->_underlyingError)
  {
    -[NETSchemaNETSessionConnectionFailed underlyingError](self, "underlyingError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("underlyingError"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("underlyingError"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NETSchemaNETSessionConnectionFailed dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (NETSchemaNETSessionConnectionFailed)initWithJSON:(id)a3
{
  void *v4;
  NETSchemaNETSessionConnectionFailed *v5;
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
    self = -[NETSchemaNETSessionConnectionFailed initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NETSchemaNETSessionConnectionFailed)initWithDictionary:(id)a3
{
  id v4;
  NETSchemaNETSessionConnectionFailed *v5;
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
  NETSchemaNETError *v16;
  void *v17;
  NETSchemaNETError *v18;
  NETSchemaNETSessionConnectionFailed *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NETSchemaNETSessionConnectionFailed;
  v5 = -[NETSchemaNETSessionConnectionFailed init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setConnectionType:](v5, "setConnectionType:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("connectionMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setConnectionMode:](v5, "setConnectionMode:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setSessionType:](v5, "setSessionType:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("networkSessionState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setNetworkSessionState:](v5, "setNetworkSessionState:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWwanPreferred"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setIsWwanPreferred:](v5, "setIsWwanPreferred:", objc_msgSend(v10, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isDormant"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setIsDormant:](v5, "setIsDormant:", objc_msgSend(v11, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sendBufferSize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NETSchemaNETSessionConnectionFailed setSendBufferSize:](v5, "setSendBufferSize:", objc_msgSend(v12, "unsignedLongLongValue"));
    v22 = v7;
    v23 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("policyId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[NETSchemaNETSessionConnectionFailed setPolicyId:](v5, "setPolicyId:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[NETSchemaNETError initWithDictionary:]([NETSchemaNETError alloc], "initWithDictionary:", v15);
      -[NETSchemaNETSessionConnectionFailed setError:](v5, "setError:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("underlyingError"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[NETSchemaNETError initWithDictionary:]([NETSchemaNETError alloc], "initWithDictionary:", v17);
      -[NETSchemaNETSessionConnectionFailed setUnderlyingError:](v5, "setUnderlyingError:", v18);

    }
    v19 = v5;

  }
  return v5;
}

- (int)connectionType
{
  return self->_connectionType;
}

- (int)connectionMode
{
  return self->_connectionMode;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (int)networkSessionState
{
  return self->_networkSessionState;
}

- (BOOL)isWwanPreferred
{
  return self->_isWwanPreferred;
}

- (BOOL)isDormant
{
  return self->_isDormant;
}

- (unint64_t)sendBufferSize
{
  return self->_sendBufferSize;
}

- (NSString)policyId
{
  return self->_policyId;
}

- (void)setPolicyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NETSchemaNETError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NETSchemaNETError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingError, a3);
}

- (void)setHasPolicyId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasError:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasUnderlyingError:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_policyId, 0);
}

@end
