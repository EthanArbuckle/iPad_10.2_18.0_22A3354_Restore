@implementation USOSchemaUSOEntitySpan

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
  v13.super_class = (Class)USOSchemaUSOEntitySpan;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v13, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[USOSchemaUSOEntitySpan deleteMatchInfo](self, "deleteMatchInfo");
  -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[USOSchemaUSOEntitySpan deletePayloadAttachmentInfo](self, "deletePayloadAttachmentInfo");

  return v5;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nodeIndex = a3;
}

- (BOOL)hasNodeIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNodeIndex
{
  -[USOSchemaUSOEntitySpan setNodeIndex:](self, "setNodeIndex:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setSourceComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sourceComponent = a3;
}

- (BOOL)hasSourceComponent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSourceComponent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteSourceComponent
{
  -[USOSchemaUSOEntitySpan setSourceComponent:](self, "setSourceComponent:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)deleteLabel
{
  -[USOSchemaUSOEntitySpan setLabel:](self, "setLabel:", 0);
}

- (BOOL)hasMatchInfo
{
  return self->_matchInfo != 0;
}

- (void)deleteMatchInfo
{
  -[USOSchemaUSOEntitySpan setMatchInfo:](self, "setMatchInfo:", 0);
}

- (void)setStartIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startIndex = a3;
}

- (BOOL)hasStartIndex
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasStartIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteStartIndex
{
  -[USOSchemaUSOEntitySpan setStartIndex:](self, "setStartIndex:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_endIndex = a3;
}

- (BOOL)hasEndIndex
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEndIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteEndIndex
{
  -[USOSchemaUSOEntitySpan setEndIndex:](self, "setEndIndex:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setOriginAppBundleIdType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_originAppBundleIdType = a3;
}

- (BOOL)hasOriginAppBundleIdType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasOriginAppBundleIdType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteOriginAppBundleIdType
{
  -[USOSchemaUSOEntitySpan setOriginAppBundleIdType:](self, "setOriginAppBundleIdType:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (BOOL)hasPayloadAttachmentInfo
{
  return self->_payloadAttachmentInfo != 0;
}

- (void)deletePayloadAttachmentInfo
{
  -[USOSchemaUSOEntitySpan setPayloadAttachmentInfo:](self, "setPayloadAttachmentInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntitySpanReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[USOSchemaUSOEntitySpan label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v8 = (char)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_11:
      if ((v8 & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9)
  {
    -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $B5B1F2BC487705B71D24B3E729459795 has;
  unsigned int v6;
  unsigned int nodeIndex;
  int v8;
  int sourceComponent;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  $B5B1F2BC487705B71D24B3E729459795 v22;
  int v23;
  unsigned int v24;
  unsigned int startIndex;
  int v26;
  unsigned int endIndex;
  int v28;
  int originAppBundleIdType;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  has = self->_has;
  v6 = v4[56];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_35;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    nodeIndex = self->_nodeIndex;
    if (nodeIndex != objc_msgSend(v4, "nodeIndex"))
      goto LABEL_35;
    has = self->_has;
    v6 = v4[56];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1))
    goto LABEL_35;
  if (v8)
  {
    sourceComponent = self->_sourceComponent;
    if (sourceComponent != objc_msgSend(v4, "sourceComponent"))
      goto LABEL_35;
  }
  -[USOSchemaUSOEntitySpan label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_34;
  -[USOSchemaUSOEntitySpan label](self, "label");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[USOSchemaUSOEntitySpan label](self, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_35;
  }
  else
  {

  }
  -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
    goto LABEL_34;
  -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_35;
  }
  else
  {

  }
  v22 = self->_has;
  v23 = (*(unsigned int *)&v22 >> 2) & 1;
  v24 = v4[56];
  if (v23 != ((v24 >> 2) & 1))
    goto LABEL_35;
  if (v23)
  {
    startIndex = self->_startIndex;
    if (startIndex != objc_msgSend(v4, "startIndex"))
      goto LABEL_35;
    v22 = self->_has;
    v24 = v4[56];
  }
  v26 = (*(unsigned int *)&v22 >> 3) & 1;
  if (v26 != ((v24 >> 3) & 1))
    goto LABEL_35;
  if (v26)
  {
    endIndex = self->_endIndex;
    if (endIndex != objc_msgSend(v4, "endIndex"))
      goto LABEL_35;
    v22 = self->_has;
    v24 = v4[56];
  }
  v28 = (*(unsigned int *)&v22 >> 4) & 1;
  if (v28 != ((v24 >> 4) & 1))
    goto LABEL_35;
  if (v28)
  {
    originAppBundleIdType = self->_originAppBundleIdType;
    if (originAppBundleIdType != objc_msgSend(v4, "originAppBundleIdType"))
      goto LABEL_35;
  }
  -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAttachmentInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v10 == 0) == (v11 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {

LABEL_38:
    v35 = 1;
    goto LABEL_36;
  }
  v31 = (void *)v30;
  -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAttachmentInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if ((v34 & 1) != 0)
    goto LABEL_38;
LABEL_35:
  v35 = 0;
LABEL_36:

  return v35;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_nodeIndex;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_sourceComponent;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_label, "hash");
  v6 = -[USOSchemaUSOMatchInfo hash](self->_matchInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_12:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[USOSchemaUSOPayloadAttachmentInfo hash](self->_payloadAttachmentInfo, "hash");
  }
  v7 = 2654435761 * self->_startIndex;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v8 = 2654435761 * self->_endIndex;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_9:
  v9 = 2654435761 * self->_originAppBundleIdType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[USOSchemaUSOPayloadAttachmentInfo hash](self->_payloadAttachmentInfo, "hash");
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
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  unsigned int v18;
  const __CFString *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpan endIndex](self, "endIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("endIndex"));

  }
  if (self->_label)
  {
    -[USOSchemaUSOEntitySpan label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("label"));

  }
  if (self->_matchInfo)
  {
    -[USOSchemaUSOEntitySpan matchInfo](self, "matchInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("matchInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("matchInfo"));

    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpan nodeIndex](self, "nodeIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("nodeIndex"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v12 = -[USOSchemaUSOEntitySpan originAppBundleIdType](self, "originAppBundleIdType") - 1;
    if (v12 > 3)
      v13 = CFSTR("USOBACKINGAPPBUNDLETYPE_UNKNOWN");
    else
      v13 = off_1E563A3D0[v12];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("originAppBundleIdType"));
  }
  if (self->_payloadAttachmentInfo)
  {
    -[USOSchemaUSOEntitySpan payloadAttachmentInfo](self, "payloadAttachmentInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("payloadAttachmentInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("payloadAttachmentInfo"));

    }
  }
  v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    v18 = -[USOSchemaUSOEntitySpan sourceComponent](self, "sourceComponent") - 1;
    if (v18 > 6)
      v19 = CFSTR("USOENTITYSPANNLUCOMPONENT_UNKNOWN");
    else
      v19 = off_1E563A3F0[v18];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sourceComponent"));
    v17 = (char)self->_has;
  }
  if ((v17 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[USOSchemaUSOEntitySpan startIndex](self, "startIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("startIndex"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[USOSchemaUSOEntitySpan dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (USOSchemaUSOEntitySpan)initWithJSON:(id)a3
{
  void *v4;
  USOSchemaUSOEntitySpan *v5;
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
    self = -[USOSchemaUSOEntitySpan initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (USOSchemaUSOEntitySpan)initWithDictionary:(id)a3
{
  id v4;
  USOSchemaUSOEntitySpan *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  USOSchemaUSOMatchInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  USOSchemaUSOPayloadAttachmentInfo *v16;
  USOSchemaUSOEntitySpan *v17;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)USOSchemaUSOEntitySpan;
  v5 = -[USOSchemaUSOEntitySpan init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nodeIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntitySpan setNodeIndex:](v5, "setNodeIndex:", objc_msgSend(v6, "unsignedIntValue"));
    v19 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntitySpan setSourceComponent:](v5, "setSourceComponent:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[USOSchemaUSOEntitySpan setLabel:](v5, "setLabel:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("matchInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[USOSchemaUSOMatchInfo initWithDictionary:]([USOSchemaUSOMatchInfo alloc], "initWithDictionary:", v10);
      -[USOSchemaUSOEntitySpan setMatchInfo:](v5, "setMatchInfo:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntitySpan setStartIndex:](v5, "setStartIndex:", objc_msgSend(v12, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntitySpan setEndIndex:](v5, "setEndIndex:", objc_msgSend(v13, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("originAppBundleIdType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[USOSchemaUSOEntitySpan setOriginAppBundleIdType:](v5, "setOriginAppBundleIdType:", objc_msgSend(v14, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("payloadAttachmentInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[USOSchemaUSOPayloadAttachmentInfo initWithDictionary:]([USOSchemaUSOPayloadAttachmentInfo alloc], "initWithDictionary:", v15);
      -[USOSchemaUSOEntitySpan setPayloadAttachmentInfo:](v5, "setPayloadAttachmentInfo:", v16);

    }
    v17 = v5;

  }
  return v5;
}

- (unsigned)nodeIndex
{
  return self->_nodeIndex;
}

- (int)sourceComponent
{
  return self->_sourceComponent;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (USOSchemaUSOMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_matchInfo, a3);
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (int)originAppBundleIdType
{
  return self->_originAppBundleIdType;
}

- (USOSchemaUSOPayloadAttachmentInfo)payloadAttachmentInfo
{
  return self->_payloadAttachmentInfo;
}

- (void)setPayloadAttachmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_payloadAttachmentInfo, a3);
}

- (void)setHasLabel:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasMatchInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasPayloadAttachmentInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
