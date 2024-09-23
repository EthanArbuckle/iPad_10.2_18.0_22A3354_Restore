@implementation MTSchemaMTFrameworkRequestSent

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
  v9.super_class = (Class)MTSchemaMTFrameworkRequestSent;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "suppressMessage");
  if ((_DWORD)v4)
    -[MTSchemaMTFrameworkRequestSent deleteFrameworkRequestId](self, "deleteFrameworkRequestId");
  return v5;
}

- (BOOL)hasFrameworkRequestId
{
  return self->_frameworkRequestId != 0;
}

- (void)deleteFrameworkRequestId
{
  -[MTSchemaMTFrameworkRequestSent setFrameworkRequestId:](self, "setFrameworkRequestId:", 0);
}

- (BOOL)hasQssSessionId
{
  return self->_qssSessionId != 0;
}

- (void)deleteQssSessionId
{
  -[MTSchemaMTFrameworkRequestSent setQssSessionId:](self, "setQssSessionId:", 0);
}

- (void)setRequestType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestType = a3;
}

- (BOOL)hasRequestType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteRequestType
{
  -[MTSchemaMTFrameworkRequestSent setRequestType:](self, "setRequestType:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setRequestRoute:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestRoute = a3;
}

- (BOOL)hasRequestRoute
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRequestRoute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteRequestRoute
{
  -[MTSchemaMTFrameworkRequestSent setRequestRoute:](self, "setRequestRoute:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setRequestSize:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requestSize = a3;
}

- (BOOL)hasRequestSize
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasRequestSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteRequestSize
{
  -[MTSchemaMTFrameworkRequestSent setRequestSize:](self, "setRequestSize:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTFrameworkRequestSentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char has;
  void *v8;
  id v9;

  v9 = a3;
  -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MTSchemaMTFrameworkRequestSent qssSessionId](self, "qssSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  v8 = v9;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteInt32Field();
    v8 = v9;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteInt32Field();
  v8 = v9;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v8 = v9;
  }
LABEL_9:

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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  $B40913571C17A7349FC22A445C89C092 has;
  unsigned int v20;
  int requestType;
  int v22;
  int requestRoute;
  int v24;
  unsigned int requestSize;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameworkRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frameworkRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[MTSchemaMTFrameworkRequestSent qssSessionId](self, "qssSessionId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "qssSessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[MTSchemaMTFrameworkRequestSent qssSessionId](self, "qssSessionId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[MTSchemaMTFrameworkRequestSent qssSessionId](self, "qssSessionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "qssSessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  has = self->_has;
  v20 = v4[36];
  if ((*(_BYTE *)&has & 1) == (v20 & 1))
  {
    if ((*(_BYTE *)&has & 1) != 0)
    {
      requestType = self->_requestType;
      if (requestType != objc_msgSend(v4, "requestType"))
        goto LABEL_12;
      has = self->_has;
      v20 = v4[36];
    }
    v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        requestRoute = self->_requestRoute;
        if (requestRoute != objc_msgSend(v4, "requestRoute"))
          goto LABEL_12;
        has = self->_has;
        v20 = v4[36];
      }
      v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (!v24 || (requestSize = self->_requestSize, requestSize == objc_msgSend(v4, "requestSize")))
        {
          v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[SISchemaUUID hash](self->_frameworkRequestId, "hash");
  v4 = -[NSString hash](self->_qssSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_requestType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_requestRoute;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_requestSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char has;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_frameworkRequestId)
  {
    -[MTSchemaMTFrameworkRequestSent frameworkRequestId](self, "frameworkRequestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("frameworkRequestId"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("frameworkRequestId"));

    }
  }
  if (self->_qssSessionId)
  {
    -[MTSchemaMTFrameworkRequestSent qssSessionId](self, "qssSessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("qssSessionId"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_10;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MTSchemaMTFrameworkRequestSent requestSize](self, "requestSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("requestSize"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_23;
    goto LABEL_19;
  }
  v10 = -[MTSchemaMTFrameworkRequestSent requestRoute](self, "requestRoute");
  v11 = CFSTR("MTFRAMEWORKREQUESTROUTE_UNKNOWN");
  if (v10 == 1)
    v11 = CFSTR("MTFRAMEWORKREQUESTROUTE_NETWORK");
  if (v10 == 2)
    v12 = CFSTR("MTFRAMEWORKREQUESTROUTE_ON_DEVICE");
  else
    v12 = v11;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requestRoute"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_18;
LABEL_10:
  if ((has & 1) == 0)
    goto LABEL_23;
LABEL_19:
  v14 = -[MTSchemaMTFrameworkRequestSent requestType](self, "requestType") - 1;
  if (v14 > 3)
    v15 = CFSTR("MTFRAMEWORKREQUESTTYPE_UNKNOWN");
  else
    v15 = off_1E563B790[v14];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("requestType"));
LABEL_23:
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MTSchemaMTFrameworkRequestSent dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MTSchemaMTFrameworkRequestSent)initWithJSON:(id)a3
{
  void *v4;
  MTSchemaMTFrameworkRequestSent *v5;
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
    self = -[MTSchemaMTFrameworkRequestSent initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MTSchemaMTFrameworkRequestSent)initWithDictionary:(id)a3
{
  id v4;
  MTSchemaMTFrameworkRequestSent *v5;
  void *v6;
  SISchemaUUID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MTSchemaMTFrameworkRequestSent *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTSchemaMTFrameworkRequestSent;
  v5 = -[MTSchemaMTFrameworkRequestSent init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameworkRequestId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[SISchemaUUID initWithDictionary:]([SISchemaUUID alloc], "initWithDictionary:", v6);
      -[MTSchemaMTFrameworkRequestSent setFrameworkRequestId:](v5, "setFrameworkRequestId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qssSessionId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[MTSchemaMTFrameworkRequestSent setQssSessionId:](v5, "setQssSessionId:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTFrameworkRequestSent setRequestType:](v5, "setRequestType:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestRoute"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTFrameworkRequestSent setRequestRoute:](v5, "setRequestRoute:", objc_msgSend(v11, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestSize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MTSchemaMTFrameworkRequestSent setRequestSize:](v5, "setRequestSize:", objc_msgSend(v12, "unsignedIntValue"));
    v13 = v5;

  }
  return v5;
}

- (SISchemaUUID)frameworkRequestId
{
  return self->_frameworkRequestId;
}

- (void)setFrameworkRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_frameworkRequestId, a3);
}

- (NSString)qssSessionId
{
  return self->_qssSessionId;
}

- (void)setQssSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)requestType
{
  return self->_requestType;
}

- (int)requestRoute
{
  return self->_requestRoute;
}

- (unsigned)requestSize
{
  return self->_requestSize;
}

- (void)setHasFrameworkRequestId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasQssSessionId:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_frameworkRequestId, 0);
}

@end
