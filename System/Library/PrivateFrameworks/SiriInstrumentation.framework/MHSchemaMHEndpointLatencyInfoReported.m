@implementation MHSchemaMHEndpointLatencyInfoReported

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
  v19.super_class = (Class)MHSchemaMHEndpointLatencyInfoReported;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v19, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[MHSchemaMHEndpointLatencyInfoReported deleteTrailingPacketLatencyInfo](self, "deleteTrailingPacketLatencyInfo");
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[MHSchemaMHEndpointLatencyInfoReported deleteCoreSpeechTrailingPacketLatencyInfo](self, "deleteCoreSpeechTrailingPacketLatencyInfo");
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[MHSchemaMHEndpointLatencyInfoReported deleteTrailingPacketLatency](self, "deleteTrailingPacketLatency");
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[MHSchemaMHEndpointLatencyInfoReported deleteCoreSpeechTrailingPacketLatency](self, "deleteCoreSpeechTrailingPacketLatency");

  return v5;
}

- (void)setFirstPacketLatencyInNs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_firstPacketLatencyInNs = a3;
}

- (BOOL)hasFirstPacketLatencyInNs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFirstPacketLatencyInNs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteFirstPacketLatencyInNs
{
  -[MHSchemaMHEndpointLatencyInfoReported setFirstPacketLatencyInNs:](self, "setFirstPacketLatencyInNs:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (BOOL)hasTrailingPacketLatencyInfo
{
  return self->_trailingPacketLatencyInfo != 0;
}

- (void)deleteTrailingPacketLatencyInfo
{
  -[MHSchemaMHEndpointLatencyInfoReported setTrailingPacketLatencyInfo:](self, "setTrailingPacketLatencyInfo:", 0);
}

- (BOOL)hasCoreSpeechTrailingPacketLatencyInfo
{
  return self->_coreSpeechTrailingPacketLatencyInfo != 0;
}

- (void)deleteCoreSpeechTrailingPacketLatencyInfo
{
  -[MHSchemaMHEndpointLatencyInfoReported setCoreSpeechTrailingPacketLatencyInfo:](self, "setCoreSpeechTrailingPacketLatencyInfo:", 0);
}

- (BOOL)hasTrailingPacketLatency
{
  return self->_trailingPacketLatency != 0;
}

- (void)deleteTrailingPacketLatency
{
  -[MHSchemaMHEndpointLatencyInfoReported setTrailingPacketLatency:](self, "setTrailingPacketLatency:", 0);
}

- (BOOL)hasCoreSpeechTrailingPacketLatency
{
  return self->_coreSpeechTrailingPacketLatency != 0;
}

- (void)deleteCoreSpeechTrailingPacketLatency
{
  -[MHSchemaMHEndpointLatencyInfoReported setCoreSpeechTrailingPacketLatency:](self, "setCoreSpeechTrailingPacketLatency:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHEndpointLatencyInfoReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  unint64_t firstPacketLatencyInNs;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != (v4[48] & 1))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    firstPacketLatencyInNs = self->_firstPacketLatencyInNs;
    if (firstPacketLatencyInNs != objc_msgSend(v4, "firstPacketLatencyInNs"))
      goto LABEL_25;
  }
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingPacketLatencyInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingPacketLatencyInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_25;
  }
  else
  {

  }
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpeechTrailingPacketLatencyInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpeechTrailingPacketLatencyInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_25;
  }
  else
  {

  }
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingPacketLatency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_24;
  -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingPacketLatency");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_25;
  }
  else
  {

  }
  -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coreSpeechTrailingPacketLatency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {

LABEL_28:
      v28 = 1;
      goto LABEL_26;
    }
    v24 = (void *)v23;
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coreSpeechTrailingPacketLatency");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
LABEL_24:

  }
LABEL_25:
  v28 = 0;
LABEL_26:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_firstPacketLatencyInNs;
  else
    v3 = 0;
  v4 = -[MHSchemaMHTrailingPacketLatencyInfo hash](self->_trailingPacketLatencyInfo, "hash") ^ v3;
  v5 = -[MHSchemaMHTrailingPacketLatencyInfo hash](self->_coreSpeechTrailingPacketLatencyInfo, "hash");
  v6 = v4 ^ v5 ^ -[MHSchemaMHStatisticDistributionInfo hash](self->_trailingPacketLatency, "hash");
  return v6 ^ -[MHSchemaMHStatisticDistributionInfo hash](self->_coreSpeechTrailingPacketLatency, "hash");
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_coreSpeechTrailingPacketLatency)
  {
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatency](self, "coreSpeechTrailingPacketLatency");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("coreSpeechTrailingPacketLatency"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("coreSpeechTrailingPacketLatency"));

    }
  }
  if (self->_coreSpeechTrailingPacketLatencyInfo)
  {
    -[MHSchemaMHEndpointLatencyInfoReported coreSpeechTrailingPacketLatencyInfo](self, "coreSpeechTrailingPacketLatencyInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("coreSpeechTrailingPacketLatencyInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("coreSpeechTrailingPacketLatencyInfo"));

    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MHSchemaMHEndpointLatencyInfoReported firstPacketLatencyInNs](self, "firstPacketLatencyInNs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("firstPacketLatencyInNs"));

  }
  if (self->_trailingPacketLatency)
  {
    -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatency](self, "trailingPacketLatency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("trailingPacketLatency"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("trailingPacketLatency"));

    }
  }
  if (self->_trailingPacketLatencyInfo)
  {
    -[MHSchemaMHEndpointLatencyInfoReported trailingPacketLatencyInfo](self, "trailingPacketLatencyInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("trailingPacketLatencyInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("trailingPacketLatencyInfo"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[MHSchemaMHEndpointLatencyInfoReported dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (MHSchemaMHEndpointLatencyInfoReported)initWithJSON:(id)a3
{
  void *v4;
  MHSchemaMHEndpointLatencyInfoReported *v5;
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
    self = -[MHSchemaMHEndpointLatencyInfoReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (MHSchemaMHEndpointLatencyInfoReported)initWithDictionary:(id)a3
{
  id v4;
  MHSchemaMHEndpointLatencyInfoReported *v5;
  void *v6;
  void *v7;
  MHSchemaMHTrailingPacketLatencyInfo *v8;
  void *v9;
  MHSchemaMHTrailingPacketLatencyInfo *v10;
  void *v11;
  MHSchemaMHStatisticDistributionInfo *v12;
  void *v13;
  MHSchemaMHStatisticDistributionInfo *v14;
  MHSchemaMHEndpointLatencyInfoReported *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MHSchemaMHEndpointLatencyInfoReported;
  v5 = -[MHSchemaMHEndpointLatencyInfoReported init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPacketLatencyInNs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[MHSchemaMHEndpointLatencyInfoReported setFirstPacketLatencyInNs:](v5, "setFirstPacketLatencyInNs:", objc_msgSend(v6, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingPacketLatencyInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[MHSchemaMHTrailingPacketLatencyInfo initWithDictionary:]([MHSchemaMHTrailingPacketLatencyInfo alloc], "initWithDictionary:", v7);
      -[MHSchemaMHEndpointLatencyInfoReported setTrailingPacketLatencyInfo:](v5, "setTrailingPacketLatencyInfo:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpeechTrailingPacketLatencyInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[MHSchemaMHTrailingPacketLatencyInfo initWithDictionary:]([MHSchemaMHTrailingPacketLatencyInfo alloc], "initWithDictionary:", v9);
      -[MHSchemaMHEndpointLatencyInfoReported setCoreSpeechTrailingPacketLatencyInfo:](v5, "setCoreSpeechTrailingPacketLatencyInfo:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trailingPacketLatency"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[MHSchemaMHStatisticDistributionInfo initWithDictionary:]([MHSchemaMHStatisticDistributionInfo alloc], "initWithDictionary:", v11);
      -[MHSchemaMHEndpointLatencyInfoReported setTrailingPacketLatency:](v5, "setTrailingPacketLatency:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coreSpeechTrailingPacketLatency"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[MHSchemaMHStatisticDistributionInfo initWithDictionary:]([MHSchemaMHStatisticDistributionInfo alloc], "initWithDictionary:", v13);
      -[MHSchemaMHEndpointLatencyInfoReported setCoreSpeechTrailingPacketLatency:](v5, "setCoreSpeechTrailingPacketLatency:", v14);

    }
    v15 = v5;

  }
  return v5;
}

- (unint64_t)firstPacketLatencyInNs
{
  return self->_firstPacketLatencyInNs;
}

- (MHSchemaMHTrailingPacketLatencyInfo)trailingPacketLatencyInfo
{
  return self->_trailingPacketLatencyInfo;
}

- (void)setTrailingPacketLatencyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPacketLatencyInfo, a3);
}

- (MHSchemaMHTrailingPacketLatencyInfo)coreSpeechTrailingPacketLatencyInfo
{
  return self->_coreSpeechTrailingPacketLatencyInfo;
}

- (void)setCoreSpeechTrailingPacketLatencyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_coreSpeechTrailingPacketLatencyInfo, a3);
}

- (MHSchemaMHStatisticDistributionInfo)trailingPacketLatency
{
  return self->_trailingPacketLatency;
}

- (void)setTrailingPacketLatency:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPacketLatency, a3);
}

- (MHSchemaMHStatisticDistributionInfo)coreSpeechTrailingPacketLatency
{
  return self->_coreSpeechTrailingPacketLatency;
}

- (void)setCoreSpeechTrailingPacketLatency:(id)a3
{
  objc_storeStrong((id *)&self->_coreSpeechTrailingPacketLatency, a3);
}

- (void)setHasTrailingPacketLatencyInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasCoreSpeechTrailingPacketLatencyInfo:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasTrailingPacketLatency:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasCoreSpeechTrailingPacketLatency:(BOOL)a3
{
  self->_hasTrailingPacketLatencyInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSpeechTrailingPacketLatency, 0);
  objc_storeStrong((id *)&self->_trailingPacketLatency, 0);
  objc_storeStrong((id *)&self->_coreSpeechTrailingPacketLatencyInfo, 0);
  objc_storeStrong((id *)&self->_trailingPacketLatencyInfo, 0);
}

@end
